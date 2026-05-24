# P25 - Python typing (~22 tipos)

> Objetivo: Memorizar los tipos y utilidades de `typing` por familia.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Tipos Básicos — 8 tipos

| Tipo | Firma + Ejemplo |
|------|-----------------|
| `Any` | `x: Any` — Acepta cualquier tipo, desactiva checker |
| `Union` | `Union[int, str]` — Múltiples tipos posibles (usar `\|` en 3.10+) |
| `Optional` | `Optional[int]` — Equivale a `Union[int, None]` |
| `Literal` | `Literal["a", "b"]` — Restringe a valores literales |
| `Final` | `Final[int]` — No puede reasignarse ni sobreescribirse |
| `Never` | `Never` — Tipo inferior, función nunca retorna (3.11+) |
| `Self` | `Self` — Referencia al tipo de la instancia actual (3.11+) |
| `TypeAlias` | `TypeAlias` — Declara alias de tipo explícito (3.10+) |

---

## 2. Tipos Genéricos (Contenedores) — 5 tipos

| Tipo | Firma + Ejemplo |
|------|-----------------|
| `List` | `List[int]` — Lista de enteros (usar `list[int]` en 3.9+) |
| `Dict` | `Dict[str, int]` — Diccionario string-int (usar `dict[str, int]` en 3.9+) |
| `Set` | `Set[str]` — Conjunto de strings (usar `set[str]` en 3.9+) |
| `Tuple` | `Tuple[int, str, ...]` — Tupla fija o variable (usar `tuple[int, ...]` en 3.9+) |
| `Callable` | `Callable[[int, str], bool]` — Función (args-retorno) |

---

## 3. Tipos Avanzados — 7 tipos

| Tipo | Firma + Ejemplo |
|------|-----------------|
| `TypeVar` | `T = TypeVar("T")` — Variable de tipo genérica |
| `Generic` | `class Stack(Generic[T]):` — Clase parametrizada por tipo |
| `Protocol` | `class Closeable(Protocol): def close(self): ...` — Tipado estructural (duck typing) |
| `TypedDict` | `class Point(TypedDict): x: int; y: int` — Dict con claves y tipos fijos |
| `Required` | `Required[int]` — Marca clave obligatoria en TypedDict total=False |
| `NotRequired` | `NotRequired[int]` — Marca clave opcional en TypedDict total=True |
| `Annotated` | `Annotated[int, Positive]` — Tipo + metadata para validación |

---

## 4. Utilidades Especiales — 5 tipos

| Tipo | Firma + Ejemplo |
|------|-----------------|
| `Unpack` | `Unpack[Tuple[int, ...]]` — Desempaqueta tipos en args posicionales (3.11+) |
| `ParamSpec` | `P = ParamSpec("P")` — Captura firma de parámetros de función |
| `Concatenate` | `Concatenate[int, P]` — Prepende argumentos a un ParamSpec |
| `overload` | `@overload` — Declara múltiples firmas para una misma función |
| `assert_never` | `assert_never(x)` — Verifica exhaustividad en match/else (checker lo usa) |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Básicos - recuerda que `Optional[X]` es azúcar para `Union[X, None]`
```python
from typing import Any, Union, Optional, Literal, Final, Never, Self, TypeAlias
# 3.10+: Union[int, str] - int | str
# 3.10+: TypeAlias - type MiAlias = int
```

### Patrón 2: Contenedores - en 3.9+ usa builtins directamente
```python
# Antes (typing):    List[int], Dict[str, int], Set[str], Tuple[int, ...]
# 3.9+ (builtins):   list[int], dict[str, int], set[str], tuple[int, ...]
# Callable siempre:  Callable[[int, str], bool]
```

### Patrón 3: Genéricos - TypeVar + Generic van juntos
```python
T = TypeVar("T")
class Stack(Generic[T]):
    def push(self, item: T) -> None: ...
    def pop(self) -> T: ...
```

### Patrón 4: Protocolo - tipado estructural, sin herencia
```python
class Drawable(Protocol):
    def draw(self) -> None: ...
# Cualquier clase con .draw() cumple, sin heredar
```

### Patrón 5: TypedDict - dict con contrato
```python
class User(TypedDict, total=False):
    name: Required[str]   # obligatoria aunque total=False
    age: NotRequired[int] # opcional aunque total=True
```

### Patrón 6: overload + assert_never - exhaustividad
```python
@overload
def process(x: int) -> str: ...
@overload
def process(x: str) -> int: ...
def process(x: int | str) -> str | int:
    if isinstance(x, int): return str(x)
    if isinstance(x, str): return len(x)
    assert_never(x)  # checker detecta casos no manejados
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Qué tipo permite cualquier valor y desactiva el checker? ___________
2. ¿Cómo se escribe Optional[int] con sintaxis 3.10+? ___________
3. ¿Qué tipo declara un dict con claves y tipos fijos? ___________
4. ¿Cuál es la diferencia entre Protocol y clase abstracta? ___________
5. ¿Qué función verifica que un match/else cubre todos los casos? ___________
6. ¿Cómo se anota una función que recibe int y str, retorna bool? ___________
7. ¿Qué tipo referencia la instancia actual en un método? ___________
8. ¿Qué utilidad permite múltiples firmas para una misma función? ___________
```

---

**Total tipos:** 25 | **Meta de memorización:** 3 días (8-9 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 25 de 28 del plan Python Mastery*