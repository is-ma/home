# P10 - Python Generators & yield (~12 patrones)
> Objetivo: Dominar la creación, control y composición de generadores para procesamiento lazy y eficiente
> Método: Escribir cada patrón desde cero, luego encadenarlos en pipelines reales

---

## Creación de Generadores

| Patrón | Sintaxis + Ejemplo |
|---|---|
| **Basic yield** | `def count_up(n):`<br>`    i = 0`<br>`    while i < n:`<br>`        yield i`<br>`        i += 1` — Produce valores uno a uno, suspende ejecución entre cada `yield` |
| **yield from (delegación)** | `def flatten(nested):`<br>`    for sub in nested:`<br>`        yield from sub` — Delega en un sub-iterable; equivalente a `for x in sub: yield x` pero propaga `.send()` y `.throw()` |
| **Generator expressions** | `squares = (x**2 for x in range(10))` — Sintaxis lazy tipo list comprehension pero con paréntesis; no construye lista en memoria |

## Control de Generadores

| Patrón | Sintaxis + Ejemplo |
|---|---|
| **.send() method** | `def echo():`<br>`    val = None`<br>`    while True:`<br>`        val = yield val`<br>`        if val is None: break`<br>`g = echo(); next(g); g.send(42)` — Envía un valor al punto de suspensión; el primer llamado debe ser `next(g)` o `g.send(None)` |
| **.throw() method** | `g.throw(ValueError, "bad input")` — Inyecta una excepción en el punto donde el generador está suspendido; útil para señalar condiciones de error |
| **.close() method** | `g.close()` — Lanza `GeneratorExit` dentro del generador; limpieza garantizada; un generador cerrado siempre retorna `StopIteration` |

## Estados y Contexto

| Patrón | Sintaxis + Ejemplo |
|---|---|
| **Generator states** | `import inspect`<br>`inspect.getgeneratorstate(g)`<br>`# GEN_CREATED - GEN_RUNNING - GEN_SUSPENDED - GEN_CLOSED` — Ciclo de vida completo; `GEN_CREATED` antes de `next()`, `GEN_SUSPENDED` tras `yield`, `GEN_CLOSED` tras retorno o `.close()` |
| **@contextmanager** | `from contextlib import contextmanager`<br>`@contextmanager`<br>`def timer(name):`<br>`    start = time.perf_counter()`<br>`    yield name`<br>`    print(f"{name}: {time.perf_counter()-start:.4f}s")` — Convierte generador en context manager; código antes de `yield` = `__enter__`, después = `__exit__` |

## Patrones Avanzados

| Patrón | Sintaxis + Ejemplo |
|---|---|
| **Infinite generators** | `def fibonacci():`<br>`    a, b = 0, 1`<br>`    while True:`<br>`        yield a`<br>`        a, b = b, a + b` — `while True` sin condición de fin; combinar con `itertools.islice(gen, n)` para consumir de forma segura |
| **Generator pipelines** | `def read_lines(path):`<br>`    yield from open(path)`<br>`def strip(lines):`<br>`    for l in lines: yield l.strip()`<br>`def filter_empty(lines):`<br>`    for l in lines:`<br>`        if l: yield l`<br>`pipeline = filter_empty(strip(read_lines("f.txt")))` — Encadenar generadores como tuberías; cada etapa procesa un elemento a la vez, sin listas intermedias |
| **@asynccontextmanager** | `from contextlib import asynccontextmanager`<br>`@asynccontextmanager`<br>`async def db_conn(url):`<br>`    conn = await aiohttp.ClientSession()`<br>`    yield conn`<br>`    await conn.close()` — Versión async de `@contextmanager`; `yield` es `await`-able, el bloque `async with` maneja `__aenter__`/`__aexit__` |
| **return + StopIteration** | `def gen_with_return():`<br>`    yield 1`<br>`    yield 2`<br>`    return "done"`<br>`g = gen_with_return()`<br>`list(g)  # [1, 2]`<br>`# El valor de return se captura en StopIteration.value`<br>`g2 = gen_with_return()`<br>`try: next(g2)`<br>`except StopIteration as e:`<br>`    print(e.value)  # "done"` — Desde Python 3.3, `return` en un generador lanza `StopIteration` con `.value`; `yield from` lo propaga automáticamente |

---

## Patrones Clave

```python
# 1. Generador con send() para coroutine-style processing
def accumulator():
    total = 0
    while True:
        val = yield total
        if val is None:
            break
        total += val

g = accumulator()
next(g)          # avanza al primer yield - 0
g.send(10)       # - 10
g.send(20)       # - 30
g.send(5)        # - 35
g.close()
```

```python
# 2. Pipeline de generadores: lectura lazy sin listas intermedias
import itertools

def read_chunks(path, size=4096):
    with open(path, "rb") as f:
        while chunk := f.read(size):
            yield chunk

def decode_lines(chunks, encoding="utf-8"):
    buffer = ""
    for chunk in chunks:
        buffer += chunk.decode(encoding)
        while "\n" in buffer:
            line, buffer = buffer.split("\n", 1)
            yield line
    if buffer:
        yield buffer

def count_words(lines):
    for line in lines:
        yield len(line.split())

pipeline = count_words(decode_lines(read_chunks("data.bin")))
total = sum(itertools.islice(pipeline, 1000))
```

```python
# 3. yield from con subgeneradores y propagación de return value
def inner():
    yield "a"
    yield "b"
    return "inner_done"

def outer():
    result = yield from inner()
    yield f"got: {result}"

list(outer())  # ["a", "b", "got: inner_done"]
```

```python
# 4. @contextmanager para gestión de recursos
from contextlib import contextmanager
import time

@contextmanager
def timed(label):
    start = time.perf_counter()
    try:
        yield
    finally:
        elapsed = time.perf_counter() - start
        print(f"{label}: {elapsed:.4f}s")

with timed("sort"):
    sorted(range(10**6, reverse=True))
```

```python
# 5. Generador infinito con itertools.islice
import itertools

def primes():
    """Generador infinito de primos (criba simple)."""
    D = {}
    q = 2
    while True:
        if q not in D:
            yield q
            D[q * q] = [q]
        else:
            for p in D[q]:
                D.setdefault(p + q, []).append(p)
            del D[q]
        q += 1

first_10 = list(itertools.islice(primes(), 10))
# [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
```

---

## Espacio de Práctica

1. Escribe un generador `factorial()` infinito. Úsalo con `islice` para obtener los primeros 8 factoriales.

2. Implementa un generador `chunked(iterable, size)` que produzca listas de `size` elementos. ¿Qué pasa si el iterable se agota antes de completar el último chunk?

3. Crea un context manager con `@contextmanager` que abra un archivo, cuente las líneas escritas durante el bloque `with`, e imprima el total al salir.

4. Construye un pipeline de 3 generadores: `read_lines(path)` - `filter_comments(lines)` (ignora líneas que empiecen con `#`) - `trim(lines)` (`.strip()`). Cuenta las líneas resultantes sin construir una lista.

5. Escribe un generador que use `.send()` para recibir números y llevar un promedio móvil de los últimos N valores. Pruébalo enviando `[10, 20, 30, 40, 50]` con N=3.

---

**Total patrones:** ~12 | **Meta:** 2-3 días | **Refuerzos:** Día +7, +30, +90

*Archivo 10 de 28 del plan Python Mastery*