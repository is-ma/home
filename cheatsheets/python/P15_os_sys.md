# P15 - Python os & sys (~25 funciones)

> Objetivo: Memorizar las funciones clave de os y sys por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Filesystem — Directorios y Archivos (os) — 7 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `os.getcwd()` | `os.getcwd() - '/home/user'` — Directorio de trabajo actual |
| `os.chdir()` | `os.chdir('/tmp') - None` — Cambia directorio de trabajo |
| `os.listdir()` | `os.listdir('.') - ['a.txt', 'b.py'] (orden arbitrario)` — Lista contenido de directorio |
| `os.mkdir()` | `os.mkdir('new_dir') - None` — Crea un directorio (error si existe) |
| `os.makedirs()` | `os.makedirs('a/b/c', exist_ok=True) - None` — Crea directorios anidados |
| `os.remove()` | `os.remove('file.txt') - None` — Elimina un archivo |
| `os.rmdir()` | `os.rmdir('empty_dir') - None` — Elimina directorio vacío |

---

## 2. Filesystem — Renombrar y Recorrer (os) — 2 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `os.rename()` | `os.rename('old.txt', 'new.txt') - None` — Renombra/mueve archivo o directorio |
| `os.walk()` | `for root, dirs, files in os.walk('.'):` — Recorre árbol de directorios recursivamente |

---

## 3. Path — Manipulación y Consulta (os.path) — 7 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `os.path.join()` | `os.path.join('dir', 'file.txt') - 'dir/file.txt'` — Une paths con separador del OS |
| `os.path.exists()` | `os.path.exists('/tmp') - True` — ¿Existe el path? |
| `os.path.isfile()` | `os.path.isfile('a.txt') - True` — ¿Es archivo regular? |
| `os.path.isdir()` | `os.path.isdir('src') - True` — ¿Es directorio? |
| `os.path.abspath()` | `os.path.abspath('.') - '/home/user'` — Path absoluto |
| `os.path.basename()` | `os.path.basename('/a/b.txt') - 'b.txt'` — Nombre del archivo |
| `os.path.dirname()` | `os.path.dirname('/a/b.txt') - '/a'` — Directorio padre del path |

---

## 4. Path — Extensión (os.path) — 1 función

| Función | Firma + Ejemplo |
|---------|-----------------|
| `os.path.splitext()` | `os.path.splitext('report.pdf') - ('report', '.pdf')` — Separa nombre y extensión |

---

## 5. Process — Entorno y Variables (os) — 1 función

| Función | Firma + Ejemplo |
|---------|-----------------|
| `os.environ` | `os.environ['HOME'] - '/home/user'` — Diccionario de variables de entorno |

---

## 6. System Info — Argumentos y Salida (sys) — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `sys.argv` | `sys.argv - ['script.py', 'arg1']` — Lista de argumentos de línea de comandos |
| `sys.exit()` | `sys.exit(1)` — Termina el proceso con código de salida |
| `sys.platform` | `sys.platform - 'linux'` — Identificador de plataforma OS |

---

## 7. System Info — Módulos y Versión (sys) — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `sys.path` | `sys.path - ['/home/user', ...]` — Lista de rutas de búsqueda de módulos |
| `sys.modules` | `sys.modules - {'os': <module 'os'>, ...}` — Diccionario de módulos cargados |
| `sys.version` | `sys.version - '3.12.0 ...'` — String con versión de Python |

---

## 8. System Info — E/S Estándar (sys) — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `sys.stdin` | `sys.stdin.readline()` — Flujo de entrada estándar |
| `sys.stdout` | `sys.stdout.write('hi\n')` — Flujo de salida estándar |
| `sys.stderr` | `sys.stderr.write('error\n')` — Flujo de error estándar |

---

## 9. System Info — Introspección (sys) — 1 función

| Función | Firma + Ejemplo |
|---------|-----------------|
| `sys.getsizeof()` | `sys.getsizeof([]) - 56` — Tamaño en bytes de un objeto en memoria |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Filesystem - recuerda el flujo de trabajo con directorios
```python
os.getcwd(), os.chdir(), os.listdir(), os.mkdir(), os.makedirs(), os.remove(), os.rmdir()
```

### Patrón 2: os.path - recuerda la familia de consultas + join
```python
os.path.join(), os.path.exists(), os.path.isfile(), os.path.isdir(), os.path.abspath(),
os.path.basename(), os.path.dirname(), os.path.splitext()
```

### Patrón 3: sys - recuerda los 5 atributos clave del intérprete
```python
sys.argv, sys.path, sys.modules, sys.platform, sys.version
```

### Patrón 4: sys E/S - recuerda los 3 flujos estándar + exit
```python
sys.stdin, sys.stdout, sys.stderr, sys.exit()
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Qué función une paths con el separador del OS? ___________
2. ¿Cómo obtienes el directorio padre de '/a/b/c.txt'? ___________
3. ¿Qué devuelve os.path.splitext('data.tar.gz')? ___________
4. ¿Cómo recorres un árbol de directorios recursivamente? ___________
5. ¿Qué atributo da los argumentos de línea de comandos? ___________
6. ¿Cuál es la diferencia entre os.mkdir() y os.makedirs()? ___________
7. ¿Cómo obtienes el tamaño en memoria de un objeto? ___________
```

---

**Total funciones:** 28 | **Meta de memorización:** 3 días (8-10 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 15 de 28 del plan Python Mastery*