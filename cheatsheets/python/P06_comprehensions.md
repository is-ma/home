# P06 - Python Comprehensions (~12 patterns)

> Objetivo: Dominar las comprehensions de Python para crear colecciones de forma concisa, eficiente y legible.
> Método: Lee el patrón + ejemplo - escribe el resultado de memoria - compara - corrige.

---

## List y Generator Comprehensions

| Patrón | Ejemplo + Resultado |
|--------|---------------------|
| List comp | `[x*2 for x in range(5)]` - `[0, 2, 4, 6, 8]` — Transforma cada elemento en una nueva lista |
| Generator exp | `(x*2 for x in range(5))` - `<generator>` — Igual que list comp pero perezoso; no materializa en memoria |
| Conditional comp | `[x for x in [-1, 0, 2, -3, 5] if x > 0]` - `[2, 5]` — Filtra elementos que no cumplen la condición |
| If-else in comp | `[x if x > 0 else 0 for x in [-1, 0, 2, -3, 5]]` - `[0, 0, 2, 0, 5]` — Transforma según condición; el if-else va antes del for |
| Walrus in comp | `[y for x in [1, -2, 3, -4] if (y := x**2) > 5]` - `[9, 16]` — Asigna y filtra en un solo paso con `:=` |

## Dict y Set Comprehensions

| Patrón | Ejemplo + Resultado |
|--------|---------------------|
| Dict comp | `{k: v for k, v in zip(["a","b"], [1,2])}` - `{'a': 1, 'b': 2}` — Crea diccionarios desde pares clave-valor |
| Set comp | `{x for x in range(10) if x % 2 == 0}` - `{0, 2, 4, 6, 8}` — Crea un set eliminando duplicados automáticamente |
| Dict comp con condición | `{k: v for k, v in {"a": 1, "b": -2, "c": 3}.items() if v > 0}` - `{'a': 1, 'c': 3}` — Filtra pares del diccionario |
| Set comp con transform | `{x.lower() for x in ["Hola", "hola", "MUNDO"]}` - `{'hola', 'mundo'}` — Transforma y elimina duplicados en un paso |

## Comprehensions Anidadas y Múltiples Loops

| Patrón | Ejemplo + Resultado |
|--------|---------------------|
| Nested list comp | `[[i*j for j in range(3)] for i in range(3)]` - `[[0,0,0],[0,1,2],[0,2,4]]` — Genera matrices o estructuras 2D |
| Double loop comp | `[(i,j) for i in [1,2] for j in ["a","b"]]` - `[(1,'a'),(1,'b'),(2,'a'),(2,'b')]` — Producto cartesiano de dos iterables |
| Nested dict comp | `{k: [v*2 for v in vals] for k, vals in {"a":[1,2], "b":[3]}.items()}` - `{'a': [2,4], 'b': [6]}` — Dict donde cada valor es una lista transformada |

## Patrones Clave

```python
# Orden de evaluación en comprehension con if-else vs if solo
[x if x > 0 else 0 for x in [-1, 2, -3]]  # if-else: TRANSFORMA (va antes del for)
[x for x in [-1, 2, -3] if x > 0]           # if solo: FILTRA (va después del for)

# Generator vs list: memoria y rendimiento
sum(x*2 for x in range(10**6))   # - eficiente, no crea lista en memoria
sum([x*2 for x in range(10**6)]) # - crea lista de 1M elementos en memoria

# Walrus operator: captura resultado intermedio
data = ["hello", "hi", "hey", "hola"]
lengths = [y for x in data if (y := len(x)) > 3]  # - [5] — y se reutiliza

# Nested dict comp: agrupa y transforma
groups = {"evens": [2, 4, 6], "odds": [1, 3, 5]}
result = {k: [v**2 for v in vals] for k, vals in groups.items()}
# - {'evens': [4, 16, 36], 'odds': [1, 9, 25]}

# Double loop: el primer for es el loop externo
A = [1, 2]
B = ["x", "y"]
[(i, j) for i in A for j in B]  # - [(1,'x'),(1,'y'),(2,'x'),(2,'y')]

# Set comp elimina duplicados automáticamente
{x % 3 for x in [0, 1, 2, 3, 4, 5]}  # - {0, 1, 2}

# Dict comp con zip: empareja dos secuencias
keys = ["nombre", "edad"]
vals = ["Ana", 30]
d = {k: v for k, v in zip(keys, vals)}  # - {'nombre': 'Ana', 'edad': 30}
```

## Espacio de Práctica

1. Escribe una list comp que convierta `["hola", "mundo", "py"]` en una lista de longitudes: `[4, 5, 2]`. ¿Qué cambia si usas un generator en vez de list comp?

2. Dado `nums = [3, -1, 4, -2, 5]`, escribe una comprehension que reemplace los negativos por 0: `[3, 0, 4, 0, 5]`. ¿Dónde va el `if-else` respecto al `for`?

3. Convierte `{1: "a", 2: "b", 3: "c"}` en `{1: "A", 2: "B", 3: "C"}` usando dict comp. ¿Cómo transformas solo los valores?

4. ¿Qué produce `[(i, j) for i in range(2) for j in range(3)]`? Escribe el resultado exacto. ¿Cuál es el loop externo?

5. Usa walrus operator para filtrar palabras de `["sol", "programación", "py", "computación"]` cuya longitud sea mayor a 5, almacenando la longitud en la misma comprehension. ¿Cuál es el resultado?

---

**Total patrones:** ~12 | **Meta:** 2 días | **Refuerzos:** Día +7, +30, +90

*Archivo 6 de 28 del plan Python Mastery*