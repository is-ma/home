# P17 - Python re (Regex) (~20 funciones)

> Objetivo: Memorizar las funciones y constantes del módulo `re` por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Búsqueda — 5 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `re.search()` | `re.search(r'\d+', 'a42b') - <Match '42'>` — Primera coincidencia en cualquier posición |
| `re.match()` | `re.match(r'\d+', '42abc') - <Match '42'>` — Coincidencia solo al inicio del string |
| `re.fullmatch()` | `re.fullmatch(r'\d+', '42') - <Match '42'>` — Coincide con el string completo |
| `re.findall()` | `re.findall(r'\d+', 'a1b22c333') - ['1','22','333']` — Lista de todas las coincidencias |
| `re.finditer()` | `re.finditer(r'\d+', 'a1b22') - iter de Match` — Iterador de Match objects |

---

## 2. Reemplazo y División — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `re.sub()` | `re.sub(r'\d+', 'X', 'a1b22') - 'aXbX'` — Reemplaza coincidencias |
| `re.subn()` | `re.subn(r'\d+', 'X', 'a1b22') - ('aXbX', 2)` — Reemplaza + cuenta de cambios |
| `re.split()` | `re.split(r'[,.]', 'a,b.c') - ['a','b','c']` — Divide por patrón |

---

## 3. Compilación — 1 función

| Función | Firma + Ejemplo |
|---------|-----------------|
| `re.compile()` | `pat = re.compile(r'\d+')` - `pat.search('a42b')` — Precompila patrón para reuso |

---

## 4. Flags — 4 constantes

| Constante | Firma + Ejemplo |
|-----------|-----------------|
| `re.IGNORECASE` | `re.search(r'hello', 'HELLO', re.I) - <Match>` — Ignora mayúsculas |
| `re.MULTILINE` | `re.search(r'^b', 'a\nb', re.M) - <Match>` — `^` y `$` por línea |
| `re.DOTALL` | `re.search(r'a.b', 'a\nb', re.S) - <Match>` — `.` incluye `\n` |
| `re.VERBOSE` | `re.compile(r''' \d+   # dígitos \s*   # espacios ''', re.X)` — Permite comentarios y espacios |

---

## 5. Utilidad — 1 función

| Función | Firma + Ejemplo |
|---------|-----------------|
| `re.escape()` | `re.escape('a.b*') - 'a\\.b\\*'` — Escapa caracteres especiales |

---

## 6. Match Object — 5 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `Match.group()` | `m = re.search(r'(\d+)-(\w+)', '42-hi'); m.group(1) - '42'` — Grupo por índice o nombre |
| `Match.groups()` | `m.groups() - ('42', 'hi')` — Tupla de todos los grupos |
| `Match.groupdict()` | `re.search(r'(?P<id>\d+)', '42').groupdict() - {'id': '42'}` — Dict de grupos nombrados |
| `Match.start()` | `m.start() - 0` — Posición inicio de la coincidencia |
| `Match.end()` | `m.end() - 2` — Posición fin de la coincidencia |
| `Match.span()` | `m.span() - (0, 2)` — Tupla (start, end) |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Búsqueda - recuerda la jerarquía de alcance
```python
re.match()       # solo inicio del string
re.search()      # primera coincidencia en cualquier posición
re.fullmatch()   # string completo debe coincidir
re.findall()     # todas las coincidencias como lista de strings
re.finditer()    # todas las coincidencias como iterador de Match
```

### Patrón 2: Reemplazo y split - recuerda que subn devuelve la cuenta
```python
re.sub(pattern, repl, string)    # string reemplazado
re.subn(pattern, repl, string)  # (string_reemplazado, cuenta)
re.split(pattern, string)        # lista de partes
```

### Patrón 3: Flags - recuerda los alias cortos
```python
re.IGNORECASE  # re.I  — ignora mayúsculas
re.MULTILINE   # re.M  — ^ y $ por línea
re.DOTALL      # re.S  — . incluye \n
re.VERBOSE     # re.X  — comentarios y espacios
```

### Patrón 4: Match object - recuerda que group(0) = match completo
```python
m.group()       # grupo 0 (match completo) o grupo por índice/nombre
m.groups()       # tupla de todos los grupos
m.groupdict()    # dict de grupos nombrados (?P<name>...)
m.start()        # posición inicio
m.end()          # posición fin
m.span()         # (start, end)
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cuál función busca solo al inicio del string? ___________
2. ¿Qué devuelve re.findall(r'\d+', 'a1b22c3')? ___________
3. ¿Qué flag hace que . coincida con \n? ___________
4. ¿Qué devuelve Match.groups()? ___________
5. ¿Cuál es la diferencia entre re.sub() y re.subn()? ___________
6. ¿Cómo precompilas un patrón para reuso? ___________
7. ¿Qué hace re.escape()? ___________
8. ¿Qué flag permite comentarios en regex? ___________
9. ¿Qué devuelve Match.span()? ___________
10. ¿Qué devuelve re.fullmatch(r'\d+', '42abc')? ___________
```

---

**Total funciones:** ~20 | **Meta de memorización:** 3 días (7 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 17 de 28 del plan Python Mastery*