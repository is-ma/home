# P11 - Python Functions & Decorators (~20 patrones)

> Objetivo: Dominar la definición de funciones, argumentos avanzados, closures, decoradores y herramientas de functools.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Definición y Lambda — 2 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `def` básica | `def f(x, y): return x + y` — Función nombrada |
| `lambda` | `lambda x, y: x + y` — Función anónima de una expresión |

```python
# def básica
def greet(name):
    return f"Hello, {name}"

greet("Ana")  # - "Hello, Ana"

# lambda (asignable pero no recomendado)
add = lambda x, y: x + y
add(2, 3)  # - 5

# lambda como argumento (uso típico)
sorted(["bob", "alice"], key=lambda s: len(s))  # - ["bob", "alice"]
```

---

## 2. Argumentos Flexibles — 4 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `*args` | `def f(*args): ...` — Argumentos posicionales arbitrarios (tupla) |
| `**kwargs` | `def f(**kwargs): ...` — Argumentos keyword arbitrarios (dict) |
| Keyword-only (después de `*`) | `def f(*, key): ...` — Obliga a pasar `key=` |
| Positional-only (antes de `/`) | `def f(x, /, y): ...` — Obliga a pasar `x` posicionalmente |

```python
# *args
def total(*args):
    return sum(args)

total(1, 2, 3)  # - 6; args = (1, 2, 3)

# **kwargs
def config(**kwargs):
    return kwargs

config(host="localhost", port=8080)  # - {'host': 'localhost', 'port': 8080}

# Keyword-only (después de *)
def connect(*, host, port):
    return f"{host}:{port}"

connect(host="db", port=5432)  # - "db:5432"
# connect("db", 5432)  # TypeError!

# Positional-only (antes de /)
def power(base, /, exp=2):
    return base ** exp

power(3)        # - 9; base solo posicional
power(3, exp=3) # - 27; exp puede ser keyword
# power(base=3)  # TypeError!
```

---

## 3. Decoradores Esenciales — 4 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `@wraps` | `@functools.wraps(wrapped)` — Preserva `__name__`, `__doc__` del decorado |
| `@lru_cache` | `@functools.lru_cache(maxsize=128)` — Memoización con límite y LRU eviction |
| `@cache` | `@functools.cache` — Memoización simple sin límite (3.9+) |
| `@singledispatch` | `@functools.singledispatch` — Overloading por tipo del primer argumento |

```python
import functools

# @wraps — sin él, el decorado pierde metadata
def my_decorator(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        return func(*args, **kwargs)
    return wrapper

@my_decorator
def hello():
    """Say hello."""
    pass

hello.__name__  # - "hello" (sin @wraps sería "wrapper")
hello.__doc__   # - "Say hello."

# @lru_cache
@functools.lru_cache(maxsize=256)
def fib(n):
    if n < 2: return n
    return fib(n - 1) + fib(n - 2)

fib(100)  # - rápido; cache_info() muestra hits/misses
fib.cache_info()  # - CacheInfo(hits=98, misses=101, maxsize=256, currsize=101)

# @cache (3.9+) — lru_cache(maxsize=None) simplificado
@functools.cache
def expensive(x):
    return x ** x

expensive(5)  # - 3125; resultado se cachea indefinidamente

# @singledispatch — overloading por tipo
@functools.singledispatch
def process(value):
    return f"default: {value}"

@process.register(int)
def _(value):
    return f"integer: {value}"

@process.register(str)
def _(value):
    return f"string: {value!r}"

process(42)       # - "integer: 42"
process("hello")  # - "string: 'hello'"
process(3.14)     # - "default: 3.14"
```

---

## 4. Clases y Orden — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `@total_ordering` | `@functools.total_ordering` — Completa comparaciones a partir de `__eq__` + una de (`__lt__`, `__le__`, `__gt__`, `__ge__`) |

```python
import functools

@functools.total_ordering
class Money:
    def __init__(self, amount):
        self.amount = amount

    def __eq__(self, other):
        return self.amount == other.amount

    def __lt__(self, other):
        return self.amount < other.amount

    # __le__, __gt__, __ge__ se generan automáticamente

Money(10) < Money(20)   # - True
Money(20) >= Money(10)  # - True
```

---

## 5. Aplicación Parcial y Reducción — 2 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `functools.partial` | `functools.partial(func, *args, **kwargs)` — Fija argumentos de una función |
| `functools.reduce` | `functools.reduce(func, iterable[, init])` — Reduce iterable a un solo valor |

```python
import functools
import operator

# functools.partial
def power(base, exp):
    return base ** exp

square = functools.partial(power, exp=2)
cube = functools.partial(power, exp=3)

square(5)  # - 25
cube(3)    # - 27

# functools.reduce
functools.reduce(operator.add, [1, 2, 3, 4])  # - 10
functools.reduce(lambda acc, x: acc + x, [1, 2, 3], 0)  # - 6

# reduce con init vacío
functools.reduce(operator.mul, [1, 2, 3, 4, 5])  # - 120 (factorial)
```

---

## 6. Módulo operator — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `operator` (itemgetter, attrgetter, methodcaller) | `itemgetter(1)`, `attrgetter('name')`, `methodcaller('upper')()` — Acceso funcional sin lambda |

```python
import operator

# itemgetter — acceso por índice o clave
rows = [("Alice", 30), ("Bob", 25)]
sorted(rows, key=operator.itemgetter(1))  # - [("Bob", 25), ("Alice", 30)]

data = [{"name": "Alice"}, {"name": "Bob"}]
list(map(operator.itemgetter("name"), data))  # - ["Alice", "Bob"]

# attrgetter — acceso a atributo
from collections import namedtuple
Point = namedtuple("Point", "x y")
p = Point(3, 4)
operator.attrgetter("x")(p)  # - 3

# methodcaller — llama método del objeto
operator.methodcaller("upper")("hello")  # - "HELLO"
operator.methodcaller("replace", "a", "o")("banana")  # - "bonono"
```

---

## 7. Closures — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| Closure (nonlocal, factory) | Función interna que captura variables del scope externo; `nonlocal` para reasignar |

```python
# Factory function con closure
def make_multiplier(factor):
    def multiply(x):
        return x * factor  # 'factor' capturada del closure
    return multiply

double = make_multiplier(2)
triple = make_multiplier(3)
double(5)  # - 10
triple(5)  # - 15

# nonlocal — modificar variable del closure
def counter(start=0):
    count = start
    def increment():
        nonlocal count
        count += 1
        return count
    return increment

c = counter()
c()  # - 1
c()  # - 2
c()  # - 3
```

---

## 8. Decoradores Avanzados — 2 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| Decorador con argumentos | Triple anidamiento: `def deco(arg): ... - def wrapper(func): ... - def inner(*a): ...` |
| Stacking de decoradores | Se aplican de abajo hacia arriba; el más cercano a `def` se ejecuta primero |

```python
import functools

# Decorador con argumentos
def repeat(times):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            for _ in range(times):
                result = func(*args, **kwargs)
            return result
        return wrapper
    return decorator

@repeat(times=3)
def say_hi(name):
    print(f"Hi {name}!")

say_hi("Ana")  # imprime "Hi Ana!" tres veces

# Stacking — se aplican de abajo hacia arriba
def bold(func):
    def wrapper():
        return f"<b>{func()}</b>"
    return wrapper

def italic(func):
    def wrapper():
        return f"<i>{func()}</i>"
    return wrapper

@bold          # se aplica segundo
@italic        # se aplica primero
def text():
    return "hello"

text()  # - "<b><i>hello</i></b>"
```

---

## 9. @property (repaso breve) — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `@property` | `@property` + `@x.setter` + `@x.deleter` — Acceso controlado como atributo |

```python
class Circle:
    def __init__(self, radius):
        self.radius = radius  # usa el setter

    @property
    def radius(self):
        return self._radius

    @radius.setter
    def radius(self, value):
        if value < 0:
            raise ValueError("Radius must be >= 0")
        self._radius = value

    @property
    def area(self):
        return 3.14159 * self._radius ** 2  - solo lectura (no setter)

c = Circle(5)
c.radius  # - 5
c.area    # - 78.53975
# c.area = 10  # AttributeError
```

---

## 10. Type Hints en Funciones — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| Type hints | `def f(x: int) -> str:` — Anotaciones de tipo para parámetros y retorno |

```python
from typing import Optional, Union, Callable

def greet(name: str, times: int = 1) -> str:
    return (f"Hello, {name}! ") * times

# Tipos comunes
def find(items: list[str], key: str) -> Optional[int]:
    """Retorna índice o None."""
    try:
        return items.index(key)
    except ValueError:
        return None

# Callable como parámetro
def apply(func: Callable[[int], str], value: int) -> str:
    return func(value)

# Union (3.10+ usa | en vez de Union)
def process(value: Union[str, int]) -> str:
    return str(value)

# Python 3.10+
# def process(value: str | int) -> str: ...
```

---

## 11. Unpacking en Llamadas — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `*` y `**` unpacking en llamadas | `f(*lista)` desempaqueta posicional; `f(**dict)` desempaqueta keyword |

```python
def add(a, b, c):
    return a + b + c

# * unpacking — lista/tupla - posicionales
args = [1, 2, 3]
add(*args)  # - 6 (equivalente a add(1, 2, 3))

# ** unpacking — dict - keywords
kwargs = {"a": 1, "b": 2, "c": 3}
add(**kwargs)  # - 6 (equivalente a add(a=1, b=2, c=3))

# Combinando
def show(name, age, city):
    return f"{name}, {age}, {city}"

data = {"name": "Ana", "age": 30}
show(city="Madrid", **data)  # - "Ana, 30, Madrid"

# Merging dicts con ** (3.9+ también usa |)
defaults = {"host": "localhost", "port": 8080}
custom = {"port": 9090}
config = {**defaults, **custom}  # - {'host': 'localhost', 'port': 9090}
```

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Orden de parámetros - recuerda la regla `/` y `*`
```python
def f(pos_only, /, pos_or_kw, *, kw_only, **kwargs): ...
```

### Patrón 2: Decoradores - recuerda la cadena de anidamiento
```python
# Sin args:  def deco(func): - wrapper
# Con args:  def deco(arg): - decorator(func): - wrapper
# Siempre usa @functools.wraps(func) en el wrapper
```

### Patrón 3: functools - recuerda la familia
```python
functools.wraps, functools.lru_cache, functools.cache,
functools.partial, functools.reduce, functools.singledispatch,
functools.total_ordering
```

### Patrón 4: operator - recuerda que reemplaza lambdas triviales
```python
# En vez de:  key=lambda x: x[1]
# Usa:        key=operator.itemgetter(1)

# En vez de:  key=lambda x: x.name
# Usa:        key=operator.attrgetter("name")
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cómo defines una función que solo acepta `port` como keyword? ___________
2. ¿Qué decorador preserva __name__ y __doc__ de la función original? ___________
3. ¿Cuál es la diferencia entre @lru_cache y @cache? ___________
4. ¿Qué hace functools.partial(func, exp=2)? ___________
5. ¿En qué orden se aplican los decoradores apilados? ___________
```

---

**Total patrones:** ~20 | **Meta:** 3 días | **Refuerzos:** Día +7, +30, +90

---

*Archivo 11 de 28 del plan Python Mastery*