# P16 - Python pathlib (~26 métodos)

> Objetivo: Memorizar los métodos esenciales de pathlib.Path por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Construcción — 3 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `Path()` | `Path("src/app.py")` — Crea ruta desde string |
| `.cwd()` | `Path.cwd()` - `PosixPath('/home/user')` — Directorio de trabajo actual |
| `.home()` | `Path.home()` - `PosixPath('/home/user')` — Directorio home del usuario |

---

## 2. Inspección — 8 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.exists()` | `p.exists() - True` — ¿Existe la ruta? |
| `.is_file()` | `p.is_file() - True` — ¿Es un archivo regular? |
| `.is_dir()` | `p.is_dir() - True` — ¿Es un directorio? |
| `.name` | `Path("src/app.py").name - 'app.py'` — Nombre con extensión |
| `.stem` | `Path("src/app.py").stem - 'app'` — Nombre sin extensión |
| `.suffix` | `Path("src/app.py").suffix - '.py'` — Extensión con punto |
| `.parent` | `Path("src/app.py").parent - PosixPath('src')` — Directorio padre directo |
| `.parents` | `Path("a/b/c").parents[0] - PosixPath('a/b')` — Secuencia de ancestros |

---

## 3. Navegación y Resolución — 5 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.resolve()` | `Path("../src").resolve() - PosixPath('/home/user/src')` — Ruta absoluta canonicalizada |
| `.relative_to()` | `Path("/a/b/c").relative_to("/a") - PosixPath('b/c')` — Ruta relativa a base |
| `.iterdir()` | `list(p.iterdir()) - [Path('a.txt'), ...]` — Itera contenido de directorio |
| `.glob()` | `list(p.glob("*.py")) - [Path('app.py'), ...]` — Patrón glob en un nivel |
| `.rglob()` | `list(p.rglob("*.py")) - [Path('a.py'), Path('src/b.py')]` — Glob recursivo |

---

## 4. Mutación y Operaciones — 6 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.mkdir()` | `Path("new_dir").mkdir(parents=True, exist_ok=True) - None` — Crea directorio |
| `.rmdir()` | `Path("old_dir").rmdir() - None` — Elimina directorio vacío |
| `.unlink()` | `Path("temp.txt").unlink(missing_ok=True) - None` — Elimina archivo |
| `.rename()` | `Path("a.txt").rename("b.txt") - PosixPath('b.txt')` — Renombra/mueve ruta |
| `.with_suffix()` | `Path("app.py").with_suffix(".txt") - PosixPath('app.txt')` — Nueva ruta con otra extensión |
| `.with_name()` | `Path("src/app.py").with_name("main.py") - PosixPath('src/main.py')` — Nueva ruta con otro nombre |

---

## 5. Entrada/Salida — 4 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `.read_text()` | `Path("f.txt").read_text(encoding="utf-8") - 'contenido'` — Lee archivo como string |
| `.write_text()` | `Path("f.txt").write_text("hola", encoding="utf-8") - 4` — Escribe string, devuelve bytes escritos |
| `.read_bytes()` | `Path("img.png").read_bytes() - b'\x89PNG...'` — Lee archivo como bytes |
| `.write_bytes()` | `Path("out.bin").write_bytes(b"\x00\xff") - 2` — Escribe bytes, devuelve cantidad escritos |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Construcción - recuerda los 3 orígenes de rutas
```python
Path("src/app.py")   # desde string
Path.cwd()           # desde directorio actual
Path.home()          # desde home del usuario
```

### Patrón 2: Inspección - recuerda la familia de propiedades puras (sin I/O)
```python
.exists(), .is_file(), .is_dir()   # preguntas booleanas
.name, .stem, .suffix              # partes del nombre
.parent, .parents                  # navegación hacia arriba
```

### Patrón 3: Navegación - recuerda que glob/rglob/iterdir devuelven generadores
```python
.iterdir()   # todo el contenido
.glob("*.py") # filtrado en un nivel
.rglob("*.py") # filtrado recursivo
```

### Patrón 4: Mutación - recuerda cuáles devuelven None vs nueva ruta
```python
.mkdir()  - None        # efecto lateral
.rmdir()  - None        # efecto lateral
.unlink() - None        # efecto lateral
.rename() - PosixPath   # devuelve nueva ruta
.with_suffix() - PosixPath  # devuelve nueva ruta
.with_name()   - PosixPath  # devuelve nueva ruta
```

### Patrón 5: I/O - recuerda el par text/bytes
```python
.read_text()  / .write_text()   # strings
.read_bytes() / .write_bytes()  # bytes
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cómo obtienes el directorio de trabajo actual con pathlib? ___________
2. ¿Qué devuelve Path("src/app.py").stem? ___________
3. ¿Cuál método elimina un archivo y cuál elimina un directorio vacío? ___________
4. ¿Cuál es la diferencia entre .glob() y .rglob()? ___________
5. ¿Qué devuelve .write_text() y qué devuelve .mkdir()? ___________
```

---

**Total métodos:** 26 | **Meta de memorización:** 3 días (8-9 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 16 de 28 del plan Python Mastery*