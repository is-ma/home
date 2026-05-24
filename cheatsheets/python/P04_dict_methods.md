# P04 - Python dict Methods (~14 methods)

> Objetivo: Dominar los métodos de dict para crear, consultar, modificar y combinar diccionarios de forma eficiente.
> Método: Activa-Practica-Espaciado - 2 días de estudio, refuerzos Día +7, +30, +90.

---

## Inspección

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.keys()` | `{'a': 1, 'b': 2}.keys()` - `dict_keys(['a', 'b'])` — Vista de todas las claves |
| `.values()` | `{'a': 1, 'b': 2}.values()` - `dict_values([1, 2])` — Vista de todos los valores |
| `.items()` | `{'a': 1, 'b': 2}.items()` - `dict_items([('a', 1), ('b', 2)])` — Vista de pares (clave, valor) |

> Las vistas son *live*: si el dict cambia, la vista refleja el cambio de inmediato. Conviértelas a `list()` si necesitas una copia estática.

## Consulta Segura

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.get(key[, default])` | `{'a': 1}.get('b', 0)` - `0` — Devuelve el valor o *default* si la clave no existe |
| `.setdefault(key[, default])` | `d = {'a': 1}; d.setdefault('b', 2)` - `2`; `d` - `{'a': 1, 'b': 2}` — Inserta clave con *default* si no existe y devuelve el valor |
| `__contains__` (`in`) | `'a' in {'a': 1}` - `True` — Comprueba si una clave existe |

## Eliminación

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.pop(key[, default])` | `{'a': 1, 'b': 2}.pop('a')` - `1` — Elimina clave y devuelve su valor; lanza KeyError si no existe y no hay default |
| `.popitem()` | `{'a': 1, 'b': 2}.popitem()` - `('b', 2)` — Elimina y devuelve el último par insertado (LIFO desde 3.7+) |
| `.clear()` | `d = {'a': 1}; d.clear()` - `None`; `d` - `{}` — Vacía el diccionario por completo |

## Copia y Construcción

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.copy()` | `original = {'a': 1}; copia = original.copy()` - `{'a': 1}` — Copia superficial (shallow copy) |
| `.fromkeys(iterable[, value])` | `dict.fromkeys(['a', 'b'], 0)` - `{'a': 0, 'b': 0}` — Crea dict desde iterable con valor uniforme |

## Actualización y Fusión

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.update([other])` | `d = {'a': 1}; d.update({'b': 2, 'a': 9})` - `None`; `d` - `{'a': 9, 'b': 2}` — Fusiona claves; las nuevas sobreescriben |
| `\|` merge (3.9+) | `{'a': 1} \| {'b': 2}` - `{'a': 1, 'b': 2}` — Nuevo dict fusionado; no muta ninguno |
| `\|=` update (3.9+) | `d = {'a': 1}; d \|= {'b': 2}` - `{'a': 1, 'b': 2}` — Fusiona *in-place* en el dict izquierdo |

---

## Patrones Clave

### Dict comprehension

```python
# Invertir clave ↔ valor
inverted = {v: k for k, v in original.items()}

# Filtrar claves
filtered = {k: v for k, v in data.items() if v > 0}

# Transformar valores
squared = {k: v ** 2 for k, v in nums.items()}
```

### .get() vs .setdefault() para conteos

```python
# Patrón con .get() — no muta si la clave no existe
counts = {}
for item in items:
    counts[item] = counts.get(item, 0) + 1

# Patrón con .setdefault() — inserta default y luego incrementa
counts = {}
for item in items:
    counts[item] = counts.setdefault(item, 0) + 1

# Mejor aún: collections.defaultdict
from collections import defaultdict
counts = defaultdict(int)
for item in items:
    counts[item] += 1
```

### Iterar con .items() y unpacking

```python
personas = {'ana': 28, 'bob': 34, 'clara': 21}

for nombre, edad in personas.items():
    print(f"{nombre} tiene {edad} años")

# Unpacking en función
def resumen(nombre, edad):
    return f"{nombre}: {edad}"

for datos in personas.items():
    print(resumen(*datos))
```

### Fusión con | y |=

```python
# | crea un nuevo dict, no muta
base = {'host': 'localhost', 'port': 3306}
override = {'port': 5432, 'ssl': True}
config = base | override  # {'host': 'localhost', 'port': 5432, 'ssl': True}

# |= actualiza in-place
base |= override  # base ahora es {'host': 'localhost', 'port': 5432, 'ssl': True}
```

---

## Espacio de Práctica

1. Dado `d = {'x': 10, 'y': 20, 'z': 30}`, escribe una línea que devuelva la suma de todos los valores usando `.values()`.

2. Usa `.setdefault()` para construir un dict que agrupe palabras por su inicial: `['ana', 'bob', 'clara', 'ben']` - `{'a': ['ana'], 'b': ['bob', 'ben'], 'c': ['clara']}`.

3. Sin usar `if`, elimina la clave `'temp'` de `d` si existe, sin lanzar error si no está.

4. Crea un dict con las claves `['a', 'b', 'c']` y valor `None` usando un solo método.

5. Fusiona `defaults = {'a': 1, 'b': 2}` y `user = {'b': 99, 'c': 3}` en un nuevo dict sin mutar ninguno, usando el operador `|`.

---

**Total métodos:** ~14 | **Meta:** 2 días | **Refuerzos:** Día +7, +30, +90

*Archivo 4 de 28 del plan Python Mastery*