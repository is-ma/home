# P09 - Python itertools (~20 funciones)

> Objetivo: Dominar las funciones de itertools para crear, combinar, filtrar y agrupar iteradores de forma eficiente y perezosa.
> Método: Memorizar firma + resultado por tabla, luego practicar los patrones clave con ejemplos reales.

---

## Infinitos

| Función | Firma + Ejemplo |
|---|---|
| `count(start=0, step=1)` | `list(islice(count(10, 2), 5))` - `[10, 12, 14, 16, 18]` — Iterador infinito que cuenta desde *start* con paso *step* |
| `cycle(iterable)` | `list(islice(cycle('AB'), 5))` - `['A', 'B', 'A', 'B', 'A']` — Repite el iterable indefinidamente |
| `repeat(elem, times=None)` | `list(repeat(7, 3))` - `[7, 7, 7]` — Repite *elem* *times* veces; infinito si se omite *times* |

## Combinatorios

| Función | Firma + Ejemplo |
|---|---|
| `product(*iterables, repeat=1)` | `list(product('AB', '12'))` - `[('A','1'),('A','2'),('B','1'),('B','2')]` — Producto cartesiano |
| `permutations(iterable, r=None)` | `list(permutations('AB', 2))` - `[('A','B'),('B','A')]` — Permutaciones de longitud *r* |
| `combinations(iterable, r)` | `list(combinations('ABC', 2))` - `[('A','B'),('A','C'),('B','C')]` — Combinaciones sin repetición |
| `combinations_with_replacement(iterable, r)` | `list(combinations_with_replacement('AB', 2))` - `[('A','A'),('A','B'),('B','B')]` — Combinaciones con repetición |

## Filtrado

| Función | Firma + Ejemplo |
|---|---|
| `compress(data, selectors)` | `list(compress('ABCDEF', [1,0,1,0,1,0]))` - `['A', 'C', 'E']` — Filtra por máscara booleana |
| `dropwhile(predicate, iterable)` | `list(dropwhile(lambda x: x<3, [1,2,3,4,1]))` - `[3, 4, 1]` — Descarta mientras *predicate* sea True |
| `takewhile(predicate, iterable)` | `list(takewhile(lambda x: x<3, [1,2,3,4,1]))` - `[1, 2]` — Toma mientras *predicate* sea True |
| `filterfalse(predicate, iterable)` | `list(filterfalse(lambda x: x%2, range(5)))` - `[0, 2, 4]` — Elementos donde *predicate* es False |

## Agrupación y Aplanamiento

| Función | Firma + Ejemplo |
|---|---|
| `chain(*iterables)` | `list(chain('AB', 'CD'))` - `['A', 'B', 'C', 'D']` — Concatena iteradores en secuencia |
| `groupby(iterable, key=None)` | `[(k, list(g)) for k, g in groupby('AAABBCC')]` - `[('A',['A','A','A']),('B',['B','B']),('C',['C','C'])]` — Agrupa elementos consecutivos iguales |
| `pairwise(iterable)` | `list(pairwise('ABCD'))` - `[('A','B'),('B','C'),('C','D')]` — Pares consecutivos (ventana deslizante de 2) |

## Mapeo

| Función | Firma + Ejemplo |
|---|---|
| `starmap(func, iterable)` | `list(starmap(pow, [(2,3),(3,2)]))` - `[8, 9]` — Aplica *func* desempaquetando cada tupla como argumentos |
| `map(func, *iterables)` | `list(map(pow, [2,3], [3,2]))` - `[8, 9]` — Built-in relacionado; aplica *func* elemento a elemento |

## Copia y Slicing

| Función | Firma + Ejemplo |
|---|---|
| `tee(iterable, n=2)` | `a, b = tee(range(3)); list(a); list(b)` - `[0,1,2]`, `[0,1,2]` — Crea *n* iteradores independientes |
| `islice(iterable, *args)` | `list(islice(range(10), 2, 8, 2))` - `[2, 4, 6]` — Slice perezoso sobre cualquier iterable |

## Utilidad

| Función | Firma + Ejemplo |
|---|---|
| `zip_longest(*iterables, fillvalue=None)` | `list(zip_longest('AB', 'XYZ', fillvalue='-'))` - `[('A','X'),('B','Y'),('-','Z')]` — Zip rellenando con *fillvalue* |
| `accumulate(iterable, func=operator.add)` | `list(accumulate([1,2,3,4]))` - `[1, 3, 6, 10]` — Acumula resultados; por defecto suma |
| `batched(iterable, n)` | `list(batched('ABCDEFG', 3))` - `[('A','B','C'),('D','E','F'),('G',)]` — Divide en lotes de tamaño *n* (3.12+) |

---

## Patrones Clave

### Consumir iterador infinito de forma segura
```python
from itertools import count, islice

for i in islice(count(1), 10):
    print(i)  # 1..10, sin bucle infinito
```

### Agrupar datos por clave (requiere orden previo)
```python
from itertools import groupby

datos = sorted([('a',1),('b',2),('a',3)], key=lambda x: x[0])
for clave, grupo in groupby(datos, key=lambda x: x[0]):
    print(clave, list(grupo))
# a [('a', 1), ('a', 3)]
# b [('b', 2)]
```

### Aplanar lista anidada
```python
from itertools import chain

anidada = [[1,2],[3,4],[5]]
plana = list(chain.from_iterable(anidada))  # [1, 2, 3, 4, 5]
```

### Acumulación personalizada
```python
from itertools import accumulate
import operator

nums = [1, 2, 3, 4]
list(accumulate(nums, operator.mul))  # [1, 2, 6, 24] — factorial progresivo
```

### Procesar por lotes
```python
from itertools import batched

for lote in batched(range(100), 10):
    procesar(lote)  # 10 elementos por lote
```

---

## Espacio de Práctica

1. Genera los primeros 20 múltiplos de 7 usando `count()` e `islice()`.
2. Dada la lista `[1,2,2,3,3,3,4]`, usa `groupby()` para contar cuántas veces aparece cada valor consecutivo.
3. Calcula todas las permutaciones de 3 elementos de `'XYZW'` con `permutations()`. ¿Cuántas hay?
4. Usa `compress()` para extraer las vocales de `'murcielago'` usando una máscara construida con comprensión.
5. Implementa una ventana deslizante de tamaño 3 sobre `[10,20,30,40,50]` usando `tee()` e `islice()` (sin usar `pairwise`).

---

**Total funciones:** ~20 | **Meta:** 3 días | **Refuerzos:** Día +7, +30, +90

*Archivo 9 de 28 del plan Python Mastery*