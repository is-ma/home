# P27 - pytest (~18 patrones)

> Objetivo: Memorizar los patrones esenciales de pytest por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Basics — aserciones y funciones de test — 3 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `assert` | `assert x == 42` — Aserción nativa de Python, pytest reescribe el traceback |
| `def test_*()` | `def test_login(): ...` — Todo test empieza con `test_` o vive en `test_*.py` |
| `pytest.raises()` | `with pytest.raises(ValueError): raise_it()` — Verifica que se lanza excepción |

---

## 2. Parametrización — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `@pytest.mark.parametrize` | `@pytest.mark.parametrize("x,y", [(1,2), (3,4)])` — Genera un test por combinación |

---

## 3. Fixtures — setup y teardown — 5 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `@pytest.fixture` | `@pytest.fixture\ndef db(): return Database()` — Inyección de dependencias en tests |
| `yield` fixture | `@pytest.fixture\ndef db(): db = Database(); yield db; db.close()` — Setup + teardown con yield |
| `scope` | `@pytest.fixture(scope="session")` — `function`(default), `class`, `module`, `session` |
| `autouse` | `@pytest.fixture(autouse=True)` — Se ejecuta automáticamente en cada test |
| `conftest.py` | Archivo en raíz del paquete; fixtures aquí son visibles sin import |

---

## 4. Marks — marcas y filtros — 3 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `@pytest.mark.skipif` | `@pytest.mark.skipif(sys.platform=="win32", reason="Linux only")` — Salta condicionalmente |
| `@pytest.mark.xfail` | `@pytest.mark.xfail(reason="bug #123")` — Se espera que falle, no rompe la suite |
| `@pytest.mark.parametrize` | (Ver sección 2) — También es una mark |

---

## 5. Captura y Monkeypatching — 3 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `capsys` | `def test_out(capsys): print("hi"); captured = capsys.readouterr()` — Captura stdout/stderr |
| `monkeypatch` | `monkeypatch.setenv("KEY", "val")` / `monkeypatch.setattr(obj, "attr", mock)` — Parcha env, atributos, sys |
| `mocker` | `mocker.patch("module.func", return_value=42)` — Requiere `pytest-mock`; wrapper de `unittest.mock` |

---

## 6. Aserciones Especiales — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `pytest.approx` | `assert 0.1 + 0.2 == pytest.approx(0.3)` — Comparación de floats con tolerancia |

---

## 7. Warnings — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `pytest.warns()` | `with pytest.warns(DeprecationWarning): old_func()` — Verifica que se emite warning |

---

## 8. Archivos Temporales — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `tmp_path` | `def test_file(tmp_path): p = tmp_path / "data.txt"; p.write_text("hi")` — Path temporal único por test |

---

## 9. Async — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `pytest-asyncio` | `@pytest.mark.asyncio\nasync def test_fetch(): await fetch()` — Requiere plugin `pytest-asyncio` |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Fixture lifecycle - recuerda `yield` para teardown
```python
@pytest.fixture
def db():
    db = Database()       # setup
    yield db               # entrega al test
    db.close()             # teardown (siempre se ejecuta)
```

### Patrón 2: Scope - recuerda la jerarquía de vida
```
function  - se crea por cada test (por defecto)
class     - una vez por clase de tests
module    - una vez por archivo
session   - una vez por toda la ejecución
```

### Patrón 3: conftest.py - recuerda que es **magia de descubrimiento**
```python
# tests/conftest.py  ← fixtures aquí son visibles en todos los tests/
@pytest.fixture
def db():
    ...
# No necesitas importar nada, pytest lo encuentra solo
```

### Patrón 4: parametrize - recuerda la firma `"nombres", [(valores)]`
```python
@pytest.mark.parametrize("input,expected", [
    ("1+1", 2),
    ("2*3", 6),
    ("10/2", 5),
])
def test_eval(input, expected):
    assert eval(input) == expected
```

### Patrón 5: raises vs warns - mismo patrón, distinto tipo
```python
with pytest.raises(ValueError): ...    # excepciones
with pytest.warns(DeprecationWarning): ...  # warnings
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cómo escribes un fixture con teardown? ___________
2. ¿Qué scope hace que el fixture se cree una sola vez por archivo? ___________
3. ¿Cómo capturas stdout en un test? ___________
4. ¿Cómo parchas una variable de entorno con monkeypatch? ___________
5. ¿Cómo comparas floats con tolerancia? ___________
6. ¿Qué archivo hace que fixtures sean visibles sin import? ___________
7. ¿Cómo marcas un test que se espera que falle? ___________
8. ¿Cómo escribes un test async? ___________
```

---

**Total patrones:** 18 | **Meta de memorización:** 3 días (6 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 27 de 28 del plan Python Mastery*