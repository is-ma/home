# P05 - Python set & frozenset Methods (~17 methods)

> Objetivo: Dominar los métodos de set y frozenset para manejar colecciones sin duplicados y operaciones de conjuntos.
> Método: Lee la firma + ejemplo - escribe el resultado de memoria - compara - corrige.

---

## Mutación básica

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.add(x)` | `s = {1,2}; s.add(3)` - `None`; `s` - `{1,2,3}` — Agrega elemento; no-op si existe |
| `.remove(x)` | `s = {1,2,3}; s.remove(2)` - `None`; `s` - `{1,3}` — Elimina; KeyError si no existe |
| `.discard(x)` | `s = {1,2,3}; s.discard(5)` - `None`; `s` - `{1,2,3}` — Elimina si existe; silencioso |
| `.pop()` | `s = {1}; s.pop()` - `1` — Elimina y retorna un elemento arbitrario; KeyError si vacío |
| `.clear()` | `s = {1,2}; s.clear()` - `None`; `s` - `set()` — Vacía el set in-place |
| `.copy()` | `a = {1,2}; b = a.copy()` - `{1,2}` — Retorna una copia superficial (shallow copy) |

## Operaciones que retornan nuevo set

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.union()` / `\|` | `{1,2}.union({2,3})` - `{1,2,3}` — Todos los elementos de ambos sets |
| `.intersection()` / `&` | `{1,2,3}.intersection({2,3,4})` - `{2,3}` — Elementos en común |
| `.difference()` / `-` | `{1,2,3}.difference({2})` - `{1,3}` — Elementos en el primero pero no en el segundo |
| `.symmetric_difference()` / `^` | `{1,2,3} ^ {2,3,4}` - `{1,4}` — Elementos en uno u otro, pero no en ambos |

## Operaciones de actualización in-place

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.update()` / `\|=` | `s = {1}; s |= {2,3}` - `{1,2,3}` — Agrega todos los elementos del otro set |
| `.intersection_update()` / `&=` | `s = {1,2,3}; s &= {2,3,4}` - `{2,3}` — Conserva solo los elementos en común |
| `.difference_update()` / `-=` | `s = {1,2,3}; s -= {2}` - `{1,3}` — Elimina los elementos presentes en el otro set |
| `.symmetric_difference_update()` / `^=` | `s = {1,2}; s ^= {2,3}` - `{1,3}` — Conserva elementos exclusivos de cada set |

## Comparaciones entre sets

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.isdisjoint()` | `{1,2}.isdisjoint({3,4})` - `True` — True si no tienen elementos en común |
| `.issubset()` / `<=` | `{1,2} <= {1,2,3}` - `True` — True si todos los elementos están contenidos en el otro |
| `.issuperset()` / `>=` | `{1,2,3} >= {1,2}` - `True` — True si contiene todos los elementos del otro |

## frozenset: set inmutable

| Concepto | Ejemplo |
|----------|---------|
| Creación | `fs = frozenset([1,2,3])` - `frozenset({1,2,3})` — Inmutable, hashable, usable como key de dict |
| Operaciones | Soporta `.union()`, `.intersection()`, `.difference()`, `.symmetric_difference()`, `.isdisjoint()`, `.issubset()`, `.issuperset()` — Sin métodos de mutación |
| Uso como key | `d = {frozenset({1,2}): "par"}` - `{frozenset({1,2}): "par"}` — Permite usar sets como claves de dict |

## Patrones Clave

```python
# Eliminar duplicados de una lista preservando orden (Python 3.7+)
list(dict.fromkeys([1, 2, 2, 3, 1]))  # - [1, 2, 3]

# Set literal: usa llaves con contenido
{1, 2, 3}          # - {1, 2, 3}

# ¡CUIDADO! Set vacío requiere set(), no {}
type({})            # - <class 'dict'>, NO set
type(set())         # - <class 'set'>

# Verificar pertenencia es O(1) en set vs O(n) en lista
3 in {1, 2, 3}      # - True  (rápido)
3 in [1, 2, 3]      # - True  (lento para listas grandes)

# Diferencia simétrica para encontrar cambios entre dos conjuntos
old = {1, 2, 3}
new = {2, 3, 4}
changed = old ^ new  # - {1, 4}

# frozenset como clave de diccionario
cache = {}
key = frozenset(["a", "b"])
cache[key] = "resultado"
cache[frozenset(["b", "a"])]  # - "resultado" (orden no importa)

# Subconjunto estricto con < y superconjunto estricto con >
{1, 2} < {1, 2, 3}   # - True  (subconjunto estricto)
{1, 2, 3} > {1, 2}   # - True  (superconjunto estricto)
{1, 2} <= {1, 2}     # - True  (subconjunto no estricto)
{1, 2} < {1, 2}      # - False (no es estricto)
```

## Espacio de Práctica

1. Dado `a = {1,2,3}` y `b = {3,4,5}`, ¿qué retorna `a | b`? ¿Y `a & b`? ¿Y `a - b`?

2. ¿Cuál es la diferencia entre `.remove()` y `.discard()`? ¿Qué pasa con `{1,2}.remove(5)` vs `{1,2}.discard(5)`?

3. ¿Por qué `type({})` retorna `dict` y no `set`? ¿Cómo creas un set vacío?

4. Si `s = {1,2,3}`, ¿qué retorna `s.pop()`? ¿Puedes predecir exactamente cuál elemento sale? ¿Por qué?

5. Convierte la lista `[1,1,2,2,3,3]` en un set y luego de vuelta a lista ordenada. ¿Cuál es el resultado final?

---

**Total métodos:** ~17 | **Meta:** 2 días | **Refuerzos:** Día +7, +30, +90

*Archivo 5 de 28 del plan Python Mastery*