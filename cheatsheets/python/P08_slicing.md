# P08 - Python Slicing & Sequence Protocol (~15 patterns)

> Objetivo: Dominar el slicing en todas sus formas y comprender el protocolo de secuencias (__getitem__, __setitem__, __delitem__) para crear tipos secuenciales personalizados.
> Método: Tabla de patrones - ejemplos concisos - práctica deliberada con los 15 patrones.

---

## Acceso Básico

| Patrón | Sintaxis + Ejemplo |
|--------|-------------------|
| Single index | `s = "hello"; s[1]` - `'e'` — Accede al elemento en la posición i |
| Negative indices | `s = "hello"; s[-1]` - `'o'`, `s[-2]` - `'l'` — Cuenta desde el final |

## Slicing Básico

| Patrón | Sintaxis + Ejemplo |
|--------|-------------------|
| Slice [i:j] | `nums = [0,1,2,3,4]; nums[1:3]` - `[1, 2]` — Subsecuencia desde i hasta j (excluye j) |
| Slice with step [i:j:k] | `nums[0:5:2]` - `[0, 2, 4]` — Subsecuencia con salto k |
| Omit start [:j] | `nums[:3]` - `[0, 1, 2]` — Desde el inicio hasta j |
| Omit end [i:] | `nums[2:]` - `[2, 3, 4]` — Desde i hasta el final |
| Omit both [::] | `nums[::]` - `[0, 1, 2, 3, 4]` — Copia completa de la secuencia |

## Slicing Avanzado

| Patrón | Sintaxis + Ejemplo |
|--------|-------------------|
| Negative step reversal | `nums[::-1]` - `[4, 3, 2, 1, 0]` — Invierte la secuencia |
| Slice assignment | `s = [0,1,2,3]; s[1:3] = [10,20]` - `[0, 10, 20, 3]` — Reemplaza un rango con nuevos valores |
| del slice | `s = [0,1,2,3]; del s[1:3]` - `[0, 3]` — Elimina un rango de elementos |

## Objeto slice()

| Patrón | Sintaxis + Ejemplo |
|--------|-------------------|
| slice() object | `sl = slice(1, 4, 2); nums[sl]` - `[1, 3]` — Crea un objeto slice reutilizable |

## Protocolo de Secuencia

| Patrón | Sintaxis + Ejemplo |
|--------|-------------------|
| __getitem__ protocol | `class Seq: def __getitem__(self, key): return data[key]` — Intercepta acceso por índice y slicing |
| __setitem__ / __delitem__ | `class Seq: def __setitem__(self, k, v): ...; def __delitem__(self, k): ...` — Intercepta asignación y eliminación por índice |

## Operaciones de Secuencia

| Patrón | Sintaxis + Ejemplo |
|--------|-------------------|
| Concatenation + repetition | `[1,2] + [3,4]` - `[1,2,3,4]`; `[0] * 3` - `[0,0,0]` — Combinar y repetir secuencias |
| Membership | `3 in [1,2,3]` - `True`; `max([1,2,3])` - `3`; `min([1,2,3])` - `1` — Pertenencia y extremos |

---

## Patrones Clave

```python
# __getitem__ recibe int o slice — maneja ambos casos
class FlexSeq:
    def __init__(self, data):
        self._data = list(data)

    def __getitem__(self, key):
        if isinstance(key, slice):
            return FlexSeq(self._data[key])  # devuelve mismo tipo
        return self._data[key]

    def __setitem__(self, key, value):
        self._data[key] = value

    def __delitem__(self, key):
        del self._data[key]

    def __len__(self):
        return len(self._data)

    def __repr__(self):
        return f"FlexSeq({self._data})"
```

```python
# slice() como objeto reutilizable
every_other = slice(None, None, 2)       # equivalente a [::2]
first_three = slice(3)                     # equivalente a [:3]
middle = slice(1, -1)                      # equivalente a [1:-1]

data = list(range(10))
data[every_other]  # [0, 2, 4, 6, 8]
data[first_three]  # [0, 1, 2]
data[middle]       # [1, 2, 3, 4, 5, 6, 7, 8]
```

```python
# Slice assignment: el reemplazo no necesita igual tamaño
s = [0, 1, 2, 3, 4]
s[1:4] = [10, 20]       # [0, 10, 20, 4] — reemplaza 3 por 2
s[1:1] = [5, 6]         # [0, 5, 6, 10, 20, 4] — inserta sin eliminar
```

---

## Espacio de Práctica

1. Dada `s = "abcdefghij"`, ¿qué devuelve `s[2:7:2]`? ¿Y `s[::-2]`?

2. Escribe una función `reverse_words(text)` que invierta el orden de las palabras en un string usando slicing.

3. Implementa una clase `CircularBuffer` que soporte slicing con índices que envuelven alrededor del buffer (ej: buf[5:2] en un buffer de tamaño 8 devuelve elementos 5,6,7,0,1).

4. ¿Cuál es la diferencia entre `del s[i]` y `del s[i:j]`? ¿Qué método de protocolo se invoca en cada caso?

5. Crea un objeto `slice` que seleccione cada tercer elemento empezando desde el segundo, y úsalo con una lista de 20 elementos.

---

**Total patrones:** ~15 | **Meta:** 2 días | **Refuerzos:** Día +7, +30, +90

*Archivo 8 de 28 del plan Python Mastery*