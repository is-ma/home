# P23 - Pydantic V2 (~30 funciones)

> Objetivo: Memorizar las funciones y clases clave de Pydantic V2 por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Modelos — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `BaseModel` | `class User(BaseModel): name: str` — Clase base para todos los modelos |
| `Field()` | `age: int = Field(gt=0, le=150, description="Edad")` — Configura campos con validación y metadatos |
| `ConfigDict()` | `model_config = ConfigDict(str_strip_whitespace=True, frozen=True)` — Configuración del modelo (reemplaza inner Config) |
| `RootModel` | `class Nums(RootModel[list[int]]): pass` — Modelo para tipos raíz (listas, dicts como top-level) |

---

## 2. Validadores de Campo — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `field_validator` | `@field_validator("age") def check_age(v): assert v > 0` — Valida un campo específico (reemplaza `@validator`) |
| `model_validator` | `@model_validator(mode="after") def check(self): assert self.start < self.end` — Valida el modelo completo (reemplaza `@root_validator`) |
| `BeforeValidator` | `Annotated[int, BeforeValidator(lambda v: int(v))]` — Valida antes de la coerción de tipo de Pydantic |
| `AfterValidator` | `Annotated[int, AfterValidator(lambda v: v * 2)]` — Valida después de la coerción de tipo |

---

## 3. Validadores Adicionales — 2 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `PlainValidator` | `Annotated[int, PlainValidator(lambda v: int(v))]` — Reemplaza la validación por completo (sin coerción de Pydantic) |
| `WrapValidator` | `Annotated[int, WrapValidator(wrap_func)]` — Envuelve la validación estándar (pre + post personalizado) |

---

## 4. Serializadores — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `field_serializer` | `@field_serializer("name") def ser_name(v): return v.upper()` — Serializa un campo específico al exportar |
| `model_serializer` | `@model_serializer def ser_model(self): return {"n": self.name}` — Serializa el modelo completo al exportar |
| `model_dump()` | `user.model_dump() - {"name": "Ana", "age": 30}` — Convierte modelo a dict (reemplaza `.dict()`) |
| `model_dump_json()` | `user.model_dump_json() - '{"name":"Ana","age":30}'` — Convierte modelo a JSON string (reemplaza `.json()`) |

---

## 5. Deserialización y Copia — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `model_validate()` | `User.model_validate({"name": "Ana"})` — Crea modelo desde dict/objeto (reemplaza `parse_obj`) |
| `model_validate_json()` | `User.model_validate_json('{"name":"Ana"}')` — Crea modelo desde JSON string (reemplaza `parse_raw`) |
| `model_copy()` | `u2 = user.model_copy(update={"age": 31})` — Copia modelo con campos actualizados (reemplaza `.copy()`) |

---

## 6. Alias y Campos Calculados — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `AliasChoices` | `Field(alias=AliasChoices("username", "user_name"))` — Múltiples nombres de alias aceptados en input |
| `AliasPath` | `Field(alias=AliasPath("address", "city"))` — Alias que extrae de una ruta anidada en el input |
| `@computed_field` | `@computed_field @property def full(self): return f"{self.first} {self.last}"` — Campo calculado incluido en dump |

---

## 7. Adaptadores — 1 función

| Función | Firma + Ejemplo |
|---------|-----------------|
| `TypeAdapter` | `ta = TypeAdapter(list[int]); ta.validate_python([1,2])` — Valida/serializa tipos sin crear un BaseModel |

---

## 8. Tipos Especiales — 8 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `EmailStr` | `email: EmailStr` — Valida formato de email (requiere `email-validator`) |
| `HttpUrl` | `url: HttpUrl` — Valida URL HTTP/HTTPS |
| `SecretStr` | `password: SecretStr` — Oculta valor en repr/dump (`.get_secret_value()` para acceder) |
| `conint()` | `conint(ge=0, le=100)` — Entero con restricciones (ge, gt, le, lt, multiple_of) |
| `constr()` | `constr(min_length=2, max_length=50, pattern=r"^[a-z]+$")` — String con restricciones |
| `PositiveInt` | `count: PositiveInt` — Entero > 0 (equivale a `conint(gt=0)`) |
| `NegativeInt` | `balance: NegativeInt` — Entero < 0 (equivale a `conint(lt=0)`) |
| `PastDate` | `born: PastDate` — Fecha en el pasado |
| `FutureDate` | `expires: FutureDate` — Fecha en el futuro |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: V2 renombró todo — recuerda la migración
```python
# V1 - V2
.dict()          - .model_dump()
.json()          - .model_dump_json()
.parse_obj()     - .model_validate()
.parse_raw()     - .model_validate_json()
.copy()          - .model_copy()
@validator       - @field_validator
@root_validator  - @model_validator
Config class     - ConfigDict()
```

### Patrón 2: Validadores Annotated — recuerda el orden del pipeline
```python
# Orden de ejecución: BeforeValidator - coerción Pydantic - AfterValidator
Annotated[int, BeforeValidator(...), AfterValidator(...)]
# PlainValidator reemplaza todo, WrapValidator envuelve
```

### Patrón 3: Serialización — recuerda dump vs validate
```python
# Salida (modelo - datos):
model_dump()          - dict
model_dump_json()     - JSON string

# Entrada (datos - modelo):
model_validate()      - desde dict/objeto
model_validate_json() - desde JSON string
```

### Patrón 4: Tipos con restricciones — recuerda la familia `con*`
```python
conint(), constr(), confloat(), conbytes(), condecimal(), conlist(), conset()
# + shortcuts: PositiveInt, NegativeInt, PastDate, FutureDate
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cómo conviertes un modelo a dict en V2? ___________
2. ¿Qué validador reemplaza a @root_validator? ___________
3. ¿Cómo creas un modelo desde JSON string? ___________
4. ¿Qué tipo oculta el valor en repr? ___________
5. ¿Cómo defines múltiples alias para un campo? ___________
6. ¿Qué función valida tipos sin crear un BaseModel? ___________
7. ¿Cuál es el orden del pipeline de validación Annotated? ___________
8. ¿Cómo copias un modelo actualizando campos? ___________
```

---

**Total funciones:** ~30 | **Meta de memorización:** 3 días (8-10 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 23 de 28 del plan Python Mastery*