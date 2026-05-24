# P02 - Python str Methods (~47 methods)

> Objetivo: Dominar los métodos de cadena para manipular, buscar, validar y formatear texto con fluidez.
> Método: Lee la firma + ejemplo, predice el resultado, comprueba en el intérprete.

---

## 1 · Case Transformation

| Método | Firma + Ejemplo |
|--------|----------------|
| `lower()` | `"Hola MUNDO".lower()` - `'hola mundo'` — Convierte todo a minúsculas |
| `upper()` | `"Hola MUNDO".upper()` - `'HOLA MUNDO'` — Convierte todo a mayúsculas |
| `title()` | `"el señor de los anillos".title()` - `'El Señor De Los Anillos'` — Primera letra de cada palabra en mayúscula |
| `capitalize()` | `"hola mundo".capitalize()` - `'Hola mundo'` — Solo la primera letra en mayúscula |
| `swapcase()` | `"HolaMundo".swapcase()` - `'hOLAmUNDO'` — Intercambia mayúsculas y minúsculas |
| `casefold()` | `"Straße".casefold()` - `'strasse'` — Versión agresiva de lower() para comparaciones Unicode |

---

## 2 · Search

| Método | Firma + Ejemplo |
|--------|----------------|
| `find(sub)` | `"python".find("th")` - `2` — Índice de la primera ocurrencia; -1 si no existe |
| `find(sub, start)` | `"python".find("th", 3)` - `-1` — Busca desde la posición start |
| `rfind(sub)` | `"abcabc".rfind("ab")` - `3` — Índice de la última ocurrencia |
| `index(sub)` | `"python".index("th")` - `2` — Como find() pero lanza ValueError si no existe |
| `rindex(sub)` | `"abcabc".rindex("ab")` - `3` — Como rfind() pero lanza ValueError si no existe |
| `count(sub)` | `"banana".count("na")` - `2` — Número de ocurrencias no solapadas |
| `startswith(prefix)` | `"python".startswith("py")` - `True` — ¿Empieza con el prefijo? |
| `startswith((a,b))` | `"python".startswith(("py","ja"))` - `True` — Acepta tupla de prefijos |
| `endswith(suffix)` | `"script.py".endswith(".py")` - `True` — ¿Termina con el sufijo? |

---

## 3 · Replace / Strip

| Método | Firma + Ejemplo |
|--------|----------------|
| `strip()` | `"  hola  ".strip()` - `'hola'` — Quita espacios (u otros chars) por ambos lados |
| `strip(chars)` | `"..hola..".strip(".")` - `'hola'` — Quita los caracteres indicados |
| `lstrip()` | `"  hola  ".lstrip()` - `'hola  '` — Quita solo por la izquierda |
| `lstrip(chars)` | `"xxhola".lstrip("x")` - `'hola'` — Quita chars indicados por la izquierda |
| `rstrip()` | `"  hola  ".rstrip()` - `'  hola'` — Quita solo por la derecha |
| `rstrip(chars)` | `"hola..".rstrip(".")` - `'hola'` — Quita chars indicados por la derecha |
| `replace(old, new)` | `"gato".replace("g", "p")` - `'pato'` — Reemplaza todas las ocurrencias |
| `replace(old, new, n)` | `"aaa".replace("a", "b", 2)` - `'bba'` — Reemplaza solo las primeras n |
| `expandtabs()` | `"a\tb".expandtabs(4)` - `'a   b'` — Convierte tabs en espacios (default 8) |

---

## 4 · Split / Join

| Método | Firma + Ejemplo |
|--------|----------------|
| `split()` | `"a b c".split()` - `['a', 'b', 'c']` — Divide por espacios en blanco |
| `split(sep)` | `"a,b,c".split(",")` - `['a', 'b', 'c']` — Divide por separador |
| `split(sep, maxsplit)` | `"a,b,c".split(",", 1)` - `['a', 'b,c']` — Límite de divisiones |
| `rsplit()` | `"a b c".rsplit()` - `['a', 'b', 'c']` — Como split() pero desde la derecha |
| `rsplit(sep, maxsplit)` | `"a,b,c".rsplit(",", 1)` - `['a,b', 'c']` — maxsplit desde la derecha |
| `splitlines()` | `"a\nb\rc".splitlines()` - `['a', 'b', 'c']` — Divide por saltos de línea |
| `partition(sep)` | `"a:b".partition(":")` - `('a', ':', 'b')` — Tupla (antes, sep, después) |
| `rpartition(sep)` | `"a:b:c".rpartition(":")` - `('a:b', ':', 'c')` — partition desde la derecha |
| `join(iterable)` | `",".join(["x","y","z"])` - `'x,y,z'` — Une elementos con el separador |

---

## 5 · Validation

| Método | Firma + Ejemplo |
|--------|----------------|
| `isdigit()` | `"42".isdigit()` - `True` — ¿Solo dígitos? |
| `isalpha()` | `"abc".isalpha()` - `True` — ¿Solo letras? |
| `isalnum()` | `"abc123".isalnum()` - `True` — ¿Solo letras o dígitos? |
| `isspace()` | `" \t\n".isspace()` - `True` — ¿Solo espacios en blanco? |
| `isascii()` | `"hello".isascii()` - `True` — ¿Todos los caracteres son ASCII? |
| `isdecimal()` | `"42".isdecimal()` - `True` — ¿Solo caracteres decimales? (más estricto que isdigit) |
| `isnumeric()` | `"Ⅷ".isnumeric()` - `True` — ¿Solo caracteres numéricos? (el más amplio) |
| `isidentifier()` | `"_var".isidentifier()` - `True` — ¿Es un identificador Python válido? |
| `islower()` | `"abc".islower()` - `True` — ¿Todas las letras son minúsculas? |
| `isupper()` | `"ABC".isupper()` - `True` — ¿Todas las letras son mayúsculas? |
| `istitle()` | `"Hello World".istitle()` - `True` — ¿Cada palabra empieza en mayúscula? |
| `isprintable()` | `"abc".isprintable()` - `True` — ¿Todos los caracteres son imprimibles? |

---

## 6 · Formatting

| Método | Firma + Ejemplo |
|--------|----------------|
| `center(width)` | `"hi".center(10)` - `'    hi    '` — Centra con espacios |
| `center(width, fill)` | `"hi".center(10, "=")` - `'====hi===='` — Centra con carácter de relleno |
| `ljust(width)` | `"hi".ljust(10)` - `'hi        '` — Alinea a la izquierda |
| `ljust(width, fill)` | `"hi".ljust(10, ".")` - `'hi........'` — Alinea a la izquierda con relleno |
| `rjust(width)` | `"hi".rjust(10)` - `'        hi'` — Alinea a la derecha |
| `rjust(width, fill)` | `"hi".rjust(10, "0")` - `'00000000hi'` — Alinea a la derecha con relleno |
| `zfill(width)` | `"42".zfill(5)` - `'00042'` — Rellena con ceros por la izquierda |

---

## 7 · Advanced

| Método | Firma + Ejemplo |
|--------|----------------|
| `encode()` | `"café".encode()` - `b'caf\xc3\xa9'` — Codifica a bytes (default UTF-8) |
| `encode(encoding)` | `"hola".encode("ascii")` - `b'hola'` — Codifica con la codificación indicada |
| `maketrans(from, to)` | `str.maketrans("ae", "12")` - `{97: 49, 101: 50}` — Crea tabla de traducción |
| `maketrans(from, to, del)` | `str.maketrans("a","1","x")` - `{97: 49, 120: None}` — Tabla con caracteres a eliminar |
| `translate(table)` | `"hola".translate(str.maketrans("a","4"))` - `'hol4'` — Aplica tabla de traducción |
| `removeprefix(prefix)` | `"unhappy".removeprefix("un")` - `'happy'` — Quita el prefijo si existe (3.9+) |
| `removesuffix(suffix)` | `"script.py".removesuffix(".py")` - `'script'` — Quita el sufijo si existe (3.9+) |

---

## 8 · Other Useful

| Método | Firma + Ejemplo |
|--------|----------------|
| `format(*args, **kwargs)` | `"{} + {}".format(1, 2)` - `'1 + 2'` — Formateo posicional |
| `format(*args, **kwargs)` | `"{name} tiene {age}".format(name="Ana", age=30)` - `'Ana tiene 30'` — Formateo con nombres |
| `format_map(mapping)` | `"{x}-{y}".format_map({"x":1, "y":2})` - `'1-2'` — Formateo desde un diccionario |

---

## Patrones Clave

```python
# 1. Limpieza de entrada: strip + lower
user_input = "  Hola  ".strip().lower()  # 'hola'

# 2. Búsqueda segura: find() no lanza error, index() sí
pos = "python".find("z")   # -1 (sin error)
# "python".index("z")       # ValueError!

# 3. Validación de entrada numérica
if s.isdecimal():
    n = int(s)

# 4. Separar y volver a unir
csv = "a,b,c"
lista = csv.split(",")       # ['a', 'b', 'c']
otra_vez = "-".join(lista)   # 'a-b-c'

# 5. Traducción con maketrans + translate
tabla = str.maketrans("aeiou", "12345")
"murcielago".translate(tabla)  # 'm5rc32l4g4'

# 6. Alineación de tablas en consola
for fila in datos:
    print(fila[0].ljust(15) + fila[1].rjust(8))

# 7. Remover prefijo/sufijo de forma segura (3.9+)
url = "https://example.com".removeprefix("https://")  # 'example.com'
archivo = "datos.csv".removesuffix(".csv")             # 'datos'

# 8. Comparación insensible a mayúsculas con casefold
a.casefold() == b.casefold()  # mejor que lower() para Unicode
```

---

## Espacio de Práctica

1. Dada `"  Python  "`, obtén `"PYTHON"` en una sola expresión.
2. `"a,b,c,d".split(",", 2)` ¿qué devuelve? Escríbelo antes de comprobar.
3. ¿Cuál es la diferencia entre `isdigit()`, `isdecimal()` e `isnumeric()`? Da un ejemplo donde den resultados distintos.
4. Convierte `"2024-01-15"` en `["2024", "01", "15"]` y luego en `"15/01/2024"` usando split y join.
5. Crea una tabla de traducción que convierta vocales en números y aplícala a `"murcielago"`.

---

**Total métodos:** ~47 | **Meta:** 3-4 días | **Refuerzos:** Día +7, +30, +90

*Archivo 2 de 28 del plan Python Mastery*