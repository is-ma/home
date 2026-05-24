# P03 - Python list & tuple Methods (~13 methods)

> Objetivo: Dominar los métodos de mutación, búsqueda y ordenación de listas y tuplas, más los patrones de slicing, concatenación y unpacking.
> Método: Lee la firma - escribe el ejemplo de memoria - compara - corrige - repite con espaciado.

---

## Mutación (agregar / quitar)

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.append(x)` | `lst = [1, 2]; lst.append(3)` - `None`; `lst` - `[1, 2, 3]` — Agrega al final |
| `.extend(iter)` | `lst = [1, 2]; lst.extend([3, 4])` - `None`; `lst` - `[1, 2, 3, 4]` — Extiende con iterable |
| `.insert(i, x)` | `lst = [1, 3]; lst.insert(1, 2)` - `None`; `lst` - `[1, 2, 3]` — Inserta en posición i |
| `.remove(x)` | `lst = [1, 2, 1]; lst.remove(1)` - `None`; `lst` - `[2, 1]` — Elimina primera ocurrencia |
| `.pop(i)` | `[1, 2, 3].pop(1)` - `2` — Elimina y devuelve el elemento en i (default -1) |
| `.clear()` | `lst = [1, 2, 3]; lst.clear()` - `None`; `lst` - `[]` — Vacía la lista in-place |

## Búsqueda y conteo

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.index(x)` | `[1, 2, 3].index(2)` - `1` — Primera posición de x; ValueError si no existe |
| `.count(x)` | `[1, 2, 1].count(1)` - `2` — Número de veces que aparece x |

## Ordenación y copia

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.sort()` | `lst = [3, 1, 2]; lst.sort()` - `None`; `lst` - `[1, 2, 3]` — Ordena in-place |
| `.sort(key=, reverse=)` | `words = ['bb','a','ccc']; words.sort(key=len, reverse=True)` - `None`; `words` - `['ccc','bb','a']` — Ordena con clave |
| `.reverse()` | `lst = [1, 2, 3]; lst.reverse()` - `None`; `lst` - `[3, 2, 1]` — Invierte in-place |
| `.copy()` | `a = [1, 2]; b = a.copy()` - `b` es copia superficial independiente |

## Tupla (inmutable)

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.count(x)` | `(1, 2, 1).count(1)` - `2` — Veces que aparece x |
| `.index(x)` | `(1, 2, 3).index(2)` - `1` — Primera posición de x |

---

## Patrones Clave

```python
# Slicing: inicio:fin:paso
nums = [0, 1, 2, 3, 4, 5]
nums[1:4]      # [1, 2, 3]
nums[::2]      # [0, 2, 4]
nums[::-1]     # [5, 4, 3, 2, 1, 0]
nums[-3:]      # [3, 4, 5]

# Concatenación y repetición
[1, 2] + [3, 4]    # [1, 2, 3, 4]
[0] * 4             # [0, 0, 0, 0]

# Unpacking con *rest
first, *rest = [1, 2, 3, 4]
# first = 1, rest = [2, 3, 4]

head, *mid, tail = [1, 2, 3, 4, 5]
# head = 1, mid = [2, 3, 4], tail = 5

# sort() con key personalizado
rows = [{'name': 'bob', 'age': 30}, {'name': 'ana', 'age': 25}]
rows.sort(key=lambda d: d['age'])
# ordenado por edad ascendente

# sorted() devuelve nueva lista (no muta)
orig = [3, 1, 2]
nuevo = sorted(orig)   # [1, 2, 3], orig sigue [3, 1, 2]

# Copia superficial vs profunda
import copy
a = [[1], [2]]
b = a.copy()          # shallow: b[0] is a[0] - True
c = copy.deepcopy(a)  # deep: c[0] is a[0] - False
```

---

## Espacio de Práctica

1. Dada `lst = [10, 20, 30, 40]`, usa slicing para obtener `[20, 30]`. ¿Qué índices usas?

2. ¿Qué diferencia hay entre `lst.append([5, 6])` y `lst.extend([5, 6])`? Escribe el resultado de cada uno sobre `[1, 2, 3]`.

3. `lst = [3, 1, 4, 1, 5]`. ¿Qué devuelve `lst.pop()` sin argumentos? ¿Y `lst.pop(0)`?

4. Escribe una línea que ordene esta lista de strings por longitud descendente: `['python', 'go', 'rust', 'c']`.

5. Usa unpacking para separar `t = (10, 20, 30, 40, 50)` en `primero`, `ultimo` y `medio` (los tres del centro).

---

**Total métodos:** ~13 | **Meta:** 2 días | **Refuerzos:** Día +7, +30, +90

*Archivo 3 de 28 del plan Python Mastery*