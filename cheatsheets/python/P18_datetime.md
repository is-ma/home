# P18 - Python datetime & time (~18 funciones)

> Objetivo: Memorizar las funciones y clases clave de datetime y time por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Construcción de Objetos — 6 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `datetime.date` | `date(2025, 6, 15)` — Crea fecha (año, mes, día) |
| `datetime.time` | `time(14, 30, 0)` — Crea hora (hora, min, seg, microseg) |
| `datetime.datetime` | `datetime(2025, 6, 15, 14, 30)` — Crea fecha+hora combinados |
| `datetime.timedelta` | `timedelta(days=7)` — Diferencia entre fechas |
| `datetime.timezone` | `timezone.utc` — Zona horaria fija (UTC) |
| `.fromtimestamp()` | `datetime.fromtimestamp(1718456400)` — Timestamp - datetime |

---

## 2. Obtención de Fecha/Hora Actual — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `.now()` | `datetime.now()` - `2025-06-15 14:30:00.123456` — Fecha/hora local actual |
| `.today()` | `date.today()` - `date(2025, 6, 15)` — Fecha actual (solo fecha) |
| `.utcnow()` | `datetime.utcnow()` - `2025-06-15 18:30:00` — UTC actual (sin tzinfo) |

---

## 3. Formateo y Parsing — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `.strftime()` | `dt.strftime("%Y-%m-%d %H:%M")` - `'2025-06-15 14:30'` — Formatea a string |
| `.strptime()` | `datetime.strptime("2025-06-15", "%Y-%m-%d")` — Parsea string - datetime |
| `.isoformat()` | `dt.isoformat()` - `'2025-06-15T14:30:00'` — Formato ISO 8601 |

---

## 4. Conversión y Modificación — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `.replace()` | `dt.replace(year=2026)` - nuevo datetime con campo cambiado |
| `.weekday()` | `dt.weekday()` - `6` (lun=0, dom=6) — Día de la semana |
| `.isoweekday()` | `dt.isoweekday()` - `7` (lun=1, dom=7) — Día ISO de la semana |

---

## 5. Módulo time — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `time.sleep()` | `time.sleep(2)` — Pausa ejecución N segundos |
| `time.time()` | `time.time()` - `1718456400.123456` — Segundos desde epoch |
| `time.perf_counter()` | `time.perf_counter()` - `0.123456` — Contador de alta resolución |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Construcción - recuerda los 3 tipos de objeto + timedelta + timezone
```python
date(y, m, d)          # solo fecha
time(h, m, s)           # solo hora
datetime(y, m, d, h, m) # fecha + hora
timedelta(days=7)       # duración/diferencia
timezone.utc             # zona horaria
```

### Patrón 2: Formateo - recuerda el par strftime/strptime (f = format out, p = parse in)
```python
.strftime("%Y-%m-%d")   # datetime - string
.strptime(s, "%Y-%m-%d") # string - datetime
.isoformat()             # datetime - ISO string
```

### Patrón 3: time module - recuerda los 3 usos distintos
```python
time.sleep(n)           # pausar
time.time()              # timestamp epoch (segundos)
time.perf_counter()     # medir duración con precisión
```

### Patrón 4: weekday - recuerda la diferencia de base
```python
.weekday()     # lun=0, dom=6  (estilo Python)
.isoweekday()  # lun=1, dom=7  (estilo ISO)
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cómo creas un datetime para el 15 de junio 2025 a las 14:30? ___________
2. ¿Qué método convierte datetime a string con formato personalizado? ___________
3. ¿Qué devuelve time.time() y time.perf_counter()? ___________
4. ¿Cuál es la diferencia entre .weekday() y .isoweekday()? ___________
5. ¿Cómo pausas la ejecución por 3 segundos? ___________
6. ¿Qué hace .replace() en un datetime? ___________
```

---

**Total funciones:** ~18 | **Meta de memorización:** 2 días (9 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 18 de 28 del plan Python Mastery*