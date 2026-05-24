# P20 - Python json, csv & configparser (~14 funciones)

> Objetivo: Memorizar las funciones clave de json, csv y configparser por familia.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. json — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `json.dumps()` | `json.dumps({"a": 1}) - '{"a": 1}'` — Objeto Python a string JSON |
| `json.loads()` | `json.loads('{"a": 1}') - {"a": 1}` — String JSON a objeto Python |
| `json.dump()` | `json.dump(obj, f)` — Escribe objeto Python a archivo JSON |
| `json.load()` | `json.load(f) - {"a": 1}` — Lee archivo JSON a objeto Python |

---

## 2. csv — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `csv.reader()` | `csv.reader(f)` - iterador de listas por fila — Lee CSV como listas |
| `csv.writer()` | `csv.writer(f).writerow(["a","b"])` — Escribe filas en CSV |
| `csv.DictReader()` | `csv.DictReader(f)` - iterador de OrderedDicts por fila — Lee CSV como diccionarios |
| `csv.DictWriter()` | `csv.DictWriter(f, fieldnames=["a","b"])` — Escribe diccionarios como filas CSV |

---

## 3. configparser.ConfigParser — 6 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `configparser.ConfigParser()` | `cfg = configparser.ConfigParser()` — Crea parser de archivo .ini |
| `.sections()` | `cfg.sections() - ['database', 'paths']` — Lista secciones (sin DEFAULT) |
| `.options()` | `cfg.options('database') - ['host', 'port']` — Lista opciones de una sección |
| `.get()` | `cfg.get('database', 'host') - 'localhost'` — Obtiene valor como string |
| `.getint()` | `cfg.getint('database', 'port') - 5432` — Obtiene valor como entero |
| `.getboolean()` | `cfg.getboolean('database', 'debug') - True` — Obtiene valor como booleano |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: json - "s" es string, sin "s" es archivo
```python
json.dumps(obj)   - string JSON    # "s" = string
json.loads(s)     - objeto Python  # "s" = string
json.dump(obj, f) - archivo        # sin "s" = file
json.load(f)      - objeto Python  # sin "s" = file
```

### Patrón 2: csv - "Dict" = diccionarios, sin "Dict" = listas
```python
csv.reader()       - filas como listas
csv.writer()       - escribe listas
csv.DictReader()   - filas como diccionarios (clave = encabezado)
csv.DictWriter()   - escribe diccionarios
```

### Patrón 3: configparser - get, getint, getboolean son variaciones de .get()
```python
cfg.get('sec', 'key')          - string
cfg.getint('sec', 'key')       - int
cfg.getboolean('sec', 'key')   - bool  (acepta yes/no, true/false, 1/0)
cfg.sections()                  - lista de secciones
cfg.options('sec')              - lista de claves en sección
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cuál función convierte un dict a string JSON? ___________
2. ¿Cuál lee un archivo JSON y devuelve un dict? ___________
3. ¿Cuál es la diferencia entre csv.reader y csv.DictReader? ___________
4. ¿Cómo obtienes un entero de un archivo .ini con configparser? ___________
5. ¿Qué devuelve cfg.sections()? ___________
6. ¿json.dump() vs json.dumps(), cuál escribe a archivo? ___________
```

---

**Total funciones:** 14 | **Meta de memorización:** 2 días (7 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 20 de 28 del plan Python Mastery*