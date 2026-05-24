# P28 - Python Logging (~14 funciones)

> Objetivo: Memorizar el módulo `logging` de Python por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Setup del Logger — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `logging.getLogger()` | `logger = logging.getLogger("app")` — Obtiene/crea logger por nombre |
| `logging.setLevel()` | `logger.setLevel(logging.DEBUG)` — Nivel mínimo que el logger procesa |
| `logging.basicConfig()` | `logging.basicConfig(level=logging.INFO, format="%(message)s")` — Configuración rápida del logger raíz |

---

## 2. Métodos de Emisión de Logs — 7 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `.debug()` | `logger.debug("Detalle: %s", var)` — Nivel DEBUG (10), diagnóstico detallado |
| `.info()` | `logger.info("Proceso completado")` — Nivel INFO (20), confirmación esperada |
| `.warning()` | `logger.warning("Disco al 90%%")` — Nivel WARNING (30), algo inesperado pero funcional |
| `.error()` | `logger.error("Fallo de conexión")` — Nivel ERROR (40), error serio |
| `.critical()` | `logger.critical("Sin memoria")` — Nivel CRITICAL (50), error fatal |
| `.exception()` | `logger.exception("Error inesperado")` — Igual que `.error()` + traceback automático |
| `.log()` | `logger.log(logging.WARNING, "msg")` — Emisión con nivel dinámico |

---

## 3. Handlers — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `logging.Formatter` | `fmt = logging.Formatter("%(asctime)s [%(levelname)s] %(name)s: %(message)s")` — Define formato de salida |
| `logging.FileHandler` | `fh = logging.FileHandler("app.log", encoding="utf-8")` — Escribe logs a archivo |
| `logging.StreamHandler` | `sh = logging.StreamHandler()` — Escribe logs a stderr (consola) |
| `logging.handlers.RotatingFileHandler` | `rh = RotatingFileHandler("app.log", maxBytes=1_048_576, backupCount=3)` — Rotación por tamaño |

---

## 4. Configuración Avanzada — 1 función

| Función | Firma + Ejemplo |
|---------|-----------------|
| `logging.config.dictConfig()` | `dictConfig({"version": 1, "formatters": {...}, "handlers": {...}, "loggers": {...}})` — Config completa vía diccionario |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Niveles - recuerda la escala numérica
```python
DEBUG=10, INFO=20, WARNING=30, ERROR=40, CRITICAL=50
```

### Patrón 2: Flujo básico - logger - handler - formatter
```python
logger = logging.getLogger("app")
logger.setLevel(logging.DEBUG)
handler = logging.StreamHandler()
handler.setFormatter(logging.Formatter("%(name)s: %(message)s"))
logger.addHandler(handler)
```

### Patrón 3: exception() vs error() - exception incluye traceback automáticamente
```python
try:
    risky()
except Exception:
    logger.exception("falló")  # incluye traceback
    logger.error("falló", exc_info=True)  # equivalente manual
```

### Patrón 4: RotatingFileHandler - maxBytes + backupCount
```python
# Cuando app.log alcanza maxBytes, rota a app.log.1, app.log.2, ...
RotatingFileHandler("app.log", maxBytes=5_000_000, backupCount=5)
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Qué nivel numérico tiene WARNING? ___________
2. ¿Cuál método emite ERROR + traceback automático? ___________
3. ¿Qué handler rota archivos por tamaño? ___________
4. ¿Cómo obtienes un logger llamado "miapp"? ___________
5. ¿Qué función configura logging desde un diccionario? ___________
```

---

**Total funciones:** 15 | **Meta de memorización:** 2 días
**Refuerzos:** Día +7, +30, +90

---

*Archivo 28 de 28 del plan Python Mastery*