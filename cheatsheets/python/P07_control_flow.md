# P07 - Python Control Flow (~15 patterns)

> Objetivo: Dominar los patrones de control de flujo en Python, desde condicionales hasta manejo de excepciones y context managers.
> Método: Tablas de patrones - ejemplos clave - práctica activa - repasos espaciados.

---

## Condicionales

| Patrón | Sintaxis + Ejemplo |
|---|---|
| if/elif/else | `if x > 0: ... elif x == 0: ... else: ...` — Ramificación clásica con múltiples condiciones |
| Ternary | `status = "ok" if code == 0 else "error"` — Expresión condicional en una línea |
| match/case (3.10+) | `match command: case "quit": ... case "go": ... case _: ...` — Pattern matching estructural |

## Bucles

| Patrón | Sintaxis + Ejemplo |
|---|---|
| for loop | `for item in items: ...` — Itera sobre cualquier iterable |
| for+else | `for x in seq: if x == target: break else: print("not found")` — `else` se ejecuta si no hubo `break` |
| while loop | `while condition: ...` — Repite mientras la condición sea verdadera |
| while+else | `while n > 1: n //= 2 else: print("reached 1")` — `else` al terminar sin `break` |
| for con enumerate | `for i, val in enumerate(items, start=1): ...` — Índice y valor simultáneos |
| for con zip | `for name, age in zip(names, ages): ...` — Itera múltiples secuencias en paralelo |
| for con reversed/sorted | `for x in reversed(items): ...` / `for x in sorted(items, key=fn): ...` — Iteración en orden invertido o personalizado |

## Control de bucles

| Patrón | Sintaxis + Ejemplo |
|---|---|
| break/continue/pass | `break` sale del bucle; `continue` salta iteración; `pass` no hace nada (placeholder) |

## Excepciones y Context Managers

| Patrón | Sintaxis + Ejemplo |
|---|---|
| try/except/else/finally | `try: ... except ValueError: ... else: ... finally: ...` — `else` si no hay error, `finally` siempre |
| raise from | `raise RuntimeError("msg") from original_error` — Encadena excepciones preservando la causa original |
| with statement | `with open("f.txt") as f: data = f.read()` — Context manager: setup/teardown automático |
| assert | `assert x > 0, "x must be positive"` — Verificación en desarrollo; se desactiva con `python -O` |

---

## Patrones Clave

```python
# for+else: buscar y actuar si no se encuentra
for item in inventory:
    if item.id == target_id:
        process(item)
        break
else:
    print(f"Item {target_id} not found")

# match/case con destructuring (Python 3.10+)
match event:
    case {"type": "click", "x": x, "y": y}:
        handle_click(x, y)
    case {"type": "key", "key": k}:
        handle_key(k)
    case _:
        handle_unknown(event)

# zip + enumerate combinados
for i, (name, score) in enumerate(zip(students, scores), start=1):
    print(f"{i}. {name}: {score}")

# Exception chaining: preserva la causa original
try:
    raw = fetch_data()
except ConnectionError as e:
    raise DataError("Failed to fetch") from e

# Context manager personalizado
from contextlib import contextmanager

@contextmanager
def timer(name):
    import time
    start = time.perf_counter()
    yield
    print(f"{name}: {time.perf_counter() - start:.4f}s")

with timer("query"):
    run_query()
```

---

## Espacio de Práctica

1. Escribe un bucle `for+else` que busque un número primo en una lista y reporte si no encuentra ninguno.

2. Usa `match/case` para clasificar una tupla `(command, args)` donde `command` puede ser `"add"`, `"delete"` o `"list"`. El caso `"add"` debe extraer dos argumentos.

3. Combina `enumerate` y `zip` para imprimir pares `(índice, nombre, edad)` a partir de tres listas.

4. Implementa un context manager con `@contextmanager` que silencie `stdout` temporalmente (redirige a `io.StringIO`).

5. Escribe una función que use `try/except/else/finally` para leer un archivo, procesar su contenido si no hay errores, y siempre cerrar el recurso (simula con `finally`).

---

**Total patrones:** ~15 | **Meta:** 2-3 días | **Refuerzos:** Día +7, +30, +90

*Archivo 7 de 28 del plan Python Mastery*