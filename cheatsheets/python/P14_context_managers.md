# P14 - Python Context Managers (~11 patrones)

> Objetivo: Dominar los context managers, desde `with` hasta `contextlib`, incluyendo variantes async y composición.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. `with` Statement Basics — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `with` statement | `with expr as var:` — Adquiere recurso, ejecuta bloque, libera automáticamente (llama `__exit__`) |

```python
# Uso básico con archivos
with open("data.txt", "r") as f:
    content = f.read()
# f.close() se llama automáticamente, incluso si hay excepción

# Múltiples recursos en un solo with
with open("in.txt") as src, open("out.txt", "w") as dst:
    dst.write(src.read())

# Implementación manual con clase
class ManagedFile:
    def __init__(self, name, mode):
        self.name = name
        self.mode = mode

    def __enter__(self):
        self.file = open(self.name, self.mode)
        return self.file

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.file.close()
        return None  # None - propaga excepciones; True - las suprime

with ManagedFile("data.txt", "r") as f:
    data = f.read()
```

---

## 2. `@contextlib.contextmanager` — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `@contextmanager` | `@contextlib.contextmanager` — Decorador que convierte un generador con `yield` en context manager |

```python
from contextlib import contextmanager

@contextmanager
def timer(label):
    import time
    start = time.perf_counter()
    yield  # ← punto de entrada; el bloque with se ejecuta aquí
    elapsed = time.perf_counter() - start
    print(f"{label}: {elapsed:.4f}s")

with timer("operación"):
    sum(range(10**6))
# - "operación: 0.0234s"

# Con manejo de excepciones en el generador
@contextmanager
def safe_open(path, mode="r"):
    f = None
    try:
        f = open(path, mode)
        yield f
    except FileNotFoundError:
        print(f"Archivo no encontrado: {path}")
        yield None
    finally:
        if f:
            f.close()

# Con yield que retorna un valor
@contextmanager
def db_transaction(conn):
    cursor = conn.cursor()
    try:
        yield cursor
        conn.commit()
    except Exception:
        conn.rollback()
        raise
```

---

## 3. `contextlib.redirect_stdout` — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `redirect_stdout` | `contextlib.redirect_stdout(target)` — Redirige `sys.stdout` a `target` dentro del bloque |

```python
from contextlib import redirect_stdout
import io

# Capturar salida de print en un string
buf = io.StringIO()
with redirect_stdout(buf):
    print("Hola mundo")
    print("Segunda línea")

output = buf.getvalue()  # - "Hola mundo\nSegunda línea\n"

# Redirigir a archivo
with open("log.txt", "w") as f:
    with redirect_stdout(f):
        print("Esto va al archivo, no a la consola")

# Redirigir a /dev/null (silenciar salida)
import os
with open(os.devnull, "w") as devnull:
    with redirect_stdout(devnull):
        print("Esto no se ve en ningún lado")
```

---

## 4. `contextlib.suppress` — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `suppress` | `contextlib.suppress(*exceptions)` — Suprime las excepciones listadas dentro del bloque |

```python
from contextlib import suppress

# Suprimir FileNotFoundError
with suppress(FileNotFoundError):
    os.remove("archivo_que_no_existe.txt")
# No lanza excepción si el archivo no existe

# Suprimir múltiples excepciones
with suppress(FileNotFoundError, PermissionError):
    os.remove("/root/archivo_protegido")
# Ignora ambos tipos de error

# Equivalente manual (más verboso)
try:
    os.remove("archivo.txt")
except (FileNotFoundError, PermissionError):
    pass

# Caso práctico: eliminar clave de dict si existe
with suppress(KeyError):
    del config["deprecated_key"]

# NOTA: suppress NO suprime excepciones del __enter__
# Solo suprime excepciones del cuerpo del with
```

---

## 5. `contextlib.ExitStack` — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `ExitStack` | `contextlib.ExitStack()` — Gestiona un número dinámico de context managers; permite limpieza condicional |

```python
from contextlib import ExitStack

# Abrir múltiples archivos dinámicamente
files = ["a.txt", "b.txt", "c.txt"]
with ExitStack() as stack:
    handles = [stack.enter_context(open(f)) for f in files]
    # Todos se cierran al salir del bloque

# Callback de limpieza con push
with ExitStack() as stack:
    stack.callback(print, "Limpieza ejecutada")
    # print("Limpieza ejecutada") se llama al salir, incluso con excepción

# Mantener el primer archivo que exista
with ExitStack() as stack:
    for path in ["primary.txt", "fallback.txt", "default.txt"]:
        try:
            f = stack.enter_context(open(path))
            break
        except FileNotFoundError:
            # pop_all() preserva los contextos ya adquiridos
            pass

# Combinar context managers condicionalmente
def process(data, use_cache=False, use_lock=False):
    with ExitStack() as stack:
        if use_cache:
            cache = stack.enter_context(open_cache())
        if use_lock:
            lock = stack.enter_context(acquire_lock())
        # Lógica principal aquí
        pass  # cleanup automático en orden inverso
```

---

## 6. `contextlib.closing` — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `closing` | `contextlib.closing(thing)` — Llama `thing.close()` al salir del bloque, incluso con excepción |

```python
from contextlib import closing
from urllib.request import urlopen

# Cerrar recurso que no es context manager nativo
with closing(urlopen("https://example.com")) as page:
    content = page.read()

# Objeto personalizado con close() pero sin __enter__/__exit__
class Connection:
    def __init__(self, host):
        self.host = host
        self.connected = True

    def close(self):
        self.connected = False
        print(f"Conexión a {self.host} cerrada")

with closing(Connection("db.local")) as conn:
    print(f"Conectado: {conn.connected}")
# - "Conexión a db.local cerrada"

# NOTA: desde Python 3.2+, muchos objetos ya soportan with nativamente
# closing() es útil para objetos legacy que solo tienen .close()
```

---

## 7. `@asynccontextmanager` — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `@asynccontextmanager` | `@contextlib.asynccontextmanager` — Versión async de `@contextmanager`; usa `yield` en función async |

```python
from contextlib import asynccontextmanager

@asynccontextmanager
async def db_connection(url):
    conn = await create_pool(url)
    try:
        yield conn
    finally:
        await conn.close()

async def main():
    async with db_connection("postgresql://localhost/db") as conn:
        result = await conn.execute("SELECT 1")

# Con manejo de excepciones
@asynccontextmanager
async def transaction(pool):
    conn = await pool.acquire()
    try:
        yield conn
        await conn.execute("COMMIT")
    except Exception:
        await conn.execute("ROLLBACK")
        raise
    finally:
        await pool.release(conn)

# Context manager async con clase
class AsyncResource:
    async def __aenter__(self):
        await self.connect()
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        await self.disconnect()
        return None

async with AsyncResource() as r:
    await r.do_work()
```

---

## 8. `contextlib.nullcontext` — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `nullcontext` | `contextlib.nullcontext(enter_result=None)` — Context manager que no hace nada; útil cuando el contexto es opcional |

```python
from contextlib import nullcontext

# Lock opcional: si no se necesita, usar nullcontext
def process(data, lock=None):
    ctx = lock or nullcontext()
    with ctx:
        return transform(data)

# Con enter_result
def read_file(path, file_handle=None):
    ctx = file_handle or nullcontext(open(path))
    with ctx as f:
        return f.read()

# Testing: deshabilitar lock en tests
lock = nullcontext() if TESTING else threading.Lock()

with lock:
    critical_section()

# nullcontext con resultado personalizado
cm = nullcontext(enter_result="dummy")
with cm as value:
    print(value)  # - "dummy"
```

---

## 9. `contextlib.redirect_stderr` — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `redirect_stderr` | `contextlib.redirect_stderr(target)` — Redirige `sys.stderr` a `target` dentro del bloque |

```python
from contextlib import redirect_stderr
import io

# Capturar errores estándar
buf = io.StringIO()
with redirect_stderr(buf):
    import sys
    sys.stderr.write("Error message\n")

errors = buf.getvalue()  # - "Error message\n"

# Redirigir stderr a archivo
with open("errors.log", "w") as f:
    with redirect_stderr(f):
        sys.stderr.write("Esto va al archivo de errores")

# Combinar redirect_stdout y redirect_stderr al mismo destino
log = io.StringIO()
with redirect_stdout(log), redirect_stderr(log):
    print("Salida normal")
    sys.stderr.write("Mensaje de error\n")

full_log = log.getvalue()  # - "Salida normal\nMensaje de error\n"
```

---

## 10. `contextlib.chdir` (3.11+) — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `chdir` | `contextlib.chdir(path)` — Cambia el directorio de trabajo temporalmente; restaura al salir del bloque |

```python
from contextlib import chdir
import os

# Cambiar directorio temporalmente
original = os.getcwd()
with chdir("/tmp"):
    os.getcwd()  # - "/tmp"
    # operaciones relativas a /tmp

os.getcwd()  # - original restaurado automáticamente

# Caso práctico: procesar archivos en otro directorio
with chdir("/data/project"):
    for f in os.listdir("."):
        if f.endswith(".csv"):
            process_csv(f)

# Equivalente manual (más propenso a errores)
old_dir = os.getcwd()
os.chdir("/tmp")
try:
    # trabajo aquí
    pass
finally:
    os.chdir(old_dir)
```

---

## 11. `contextlib.ContextDecorator` — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `ContextDecorator` | `contextlib.ContextDecorator` — Permite usar un context manager como decorador de función sin `with` explícito |

```python
from contextlib import ContextDecorator

# Crear context manager usable como decorador
class timer(ContextDecorator):
    def __init__(self, label=""):
        self.label = label

    def __enter__(self):
        import time
        self.start = time.perf_counter()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        import time
        elapsed = time.perf_counter() - self.start
        print(f"{self.label}: {elapsed:.4f}s")
        return None

# Uso como decorador (sin with explícito)
@timer("slow_func")
def slow_function():
    sum(range(10**6))

slow_function()  # - "slow_func: 0.0234s"

# Uso como context manager (con with)
with timer("bloque"):
    sum(range(10**6))

# Combinar @contextmanager con ContextDecorator
class my_context(ContextDecorator):
    def __enter__(self):
        print("Entrando")
        return self

    def __exit__(self, *args):
        print("Saliendo")
        return None

@my_context()
def greet():
    print("Hola!")

greet()
# - "Entrando" - "Hola!" - "Saliendo"
```

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Protocolo context manager - recuerda `__enter__` + `__exit__`
```python
class CM:
    def __enter__(self): return self
    def __exit__(self, exc_type, exc_val, exc_tb): return None  # None propaga, True suprime
```

### Patrón 2: contextlib - recuerda la familia completa
```python
contextlib.contextmanager   # generador - context manager
contextlib.redirect_stdout # redirige stdout
contextlib.redirect_stderr # redirige stderr
contextlib.suppress         # ignora excepciones
contextlib.ExitStack        # N dinámico de context managers
contextlib.closing          # llama .close() al salir
contextlib.nullcontext      # no-op, útil para opcionales
contextlib.chdir            # cd temporal (3.11+)
contextlib.ContextDecorator # CM usable como decorador
contextlib.asynccontextmanager  # versión async
```

### Patrón 3: ExitStack - recuerda `enter_context()` + `callback()`
```python
with ExitStack() as stack:
    f = stack.enter_context(open("f.txt"))   # registra CM
    stack.callback(cleanup, arg)               # registra callback
    # todo se limpia al salir, en orden inverso
```

### Patrón 4: @contextmanager - recuerda el patrón yield
```python
@contextmanager
def cm():
    setup()        # antes de yield = __enter__
    yield value    # valor retornado al as
    teardown()     # después de yield = __exit__ (en finally)
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Qué métodos debe implementar una clase para ser context manager? ___________
2. ¿Qué decorador convierte un generador en context manager? ___________
3. ¿Qué hace contextlib.suppress(FileNotFoundError)? ___________
4. ¿Cómo manejas un número dinámico de context managers? ___________
5. ¿Cuál es la diferencia entre closing() y un context manager nativo? ___________
6. ¿Qué versión async de @contextmanager existe? ___________
7. ¿Para qué sirve nullcontext? ___________
8. ¿Qué hace __exit__ si retorna True? ___________
9. ¿Qué hace contextlib.chdir("/tmp") al salir del bloque? ___________
10. ¿Cómo usas un context manager como decorador de función? ___________
```

---

**Total patrones:** ~11 | **Meta:** 3 días | **Refuerzos:** Día +7, +30, +90

---

*Archivo 14 de 28 del plan Python Mastery*