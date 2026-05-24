# P12 - Python Dunder Methods (Data Model) (~46 métodos)

> Objetivo: Memorizar los dunder methods de Python por familia semántica.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Lifecycle — 3 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__new__(cls, *args, **kwargs)` | `def __new__(cls): return super().__new__(cls)` — Crea la instancia (antes de `__init__`) |
| `__init__(self, *args, **kwargs)` | `def __init__(self, x): self.x = x` — Inicializa la instancia |
| `__del__(self)` | `def __del__(self): ... - None` — Destructor (GC lo llama, no confíes en el orden) |

---

## 2. String — 3 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__str__(self)` | `def __str__(self): return "user" - str(obj)` — Representación legible |
| `__repr__(self)` | `def __repr__(self): return f"User({self.id})" - repr(obj)` — Representación canónica (debug) |
| `__format__(self, spec)` | `def __format__(self, spec): return f"{self.x:{spec}}" - format(obj, ".2f")` — Formateo con f-string |

---

## 3. Comparison — 8 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__eq__(self, other)` | `def __eq__(self, o): return self.x == o.x - bool` — Igualdad (`==`) |
| `__ne__(self, other)` | `def __ne__(self, o): return not self.__eq__(o) - bool` — Desigualdad (`!=`), auto si defines `__eq__` |
| `__lt__(self, other)` | `def __lt__(self, o): return self.x < o.x - bool` — Menor que (`<`) |
| `__le__(self, other)` | `def __le__(self, o): return self.x <= o.x - bool` — Menor o igual (`<=`) |
| `__gt__(self, other)` | `def __gt__(self, o): return self.x > o.x - bool` — Mayor que (`>`) |
| `__ge__(self, other)` | `def __ge__(self, o): return self.x >= o.x - bool` — Mayor o igual (`>=`) |
| `__hash__(self)` | `def __hash__(self): return hash(self.x) - int` — Hash para dict/set (requiere `__eq__`) |
| `__bool__(self)` | `def __bool__(self): return bool(self.x) - bool` — Truthiness (`if obj:`) |

---

## 4. Container — 7 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__len__(self)` | `def __len__(self): return len(self.data) - int` — `len(obj)` |
| `__getitem__(self, key)` | `def __getitem__(self, k): return self.data[k] - value` — `obj[k]` |
| `__setitem__(self, key, value)` | `def __setitem__(self, k, v): self.data[k] = v - None` — `obj[k] = v` |
| `__delitem__(self, key)` | `def __delitem__(self, k): del self.data[k] - None` — `del obj[k]` |
| `__iter__(self)` | `def __iter__(self): return iter(self.data) - iterator` — `for x in obj` |
| `__next__(self)` | `def __next__(self): ... - item` — Próximo elemento del iterador |
| `__contains__(self, item)` | `def __contains__(self, x): return x in self.data - bool` — `x in obj` |

---

## 5. Callable — 1 método

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__call__(self, *args, **kwargs)` | `def __call__(self, x): return x * 2 - obj(5) - 10` — Instancia invocable como función |

---

## 6. Context — 2 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__enter__(self)` | `def __enter__(self): return self - obj` — Entrada al `with` |
| `__exit__(self, exc_type, exc_val, exc_tb)` | `def __exit__(self, *exc): ... - None` — Salida del `with` (suprime excepción retornando `True`) |

---

## 7. Arithmetic — 7 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__add__(self, other)` | `def __add__(self, o): return self.val + o.val - new` — `obj + other` |
| `__sub__(self, other)` | `def __sub__(self, o): return self.val - o.val - new` — `obj - other` |
| `__mul__(self, other)` | `def __mul__(self, o): return self.val * o.val - new` — `obj * other` |
| `__truediv__(self, other)` | `def __truediv__(self, o): return self.val / o.val - new` — `obj / other` (división flotante) |
| `__floordiv__(self, other)` | `def __floordiv__(self, o): return self.val // o.val - new` — `obj // other` (división entera) |
| `__mod__(self, other)` | `def __mod__(self, o): return self.val % o.val - new` — `obj % other` |
| `__pow__(self, other)` | `def __pow__(self, o): return self.val ** o.val - new` — `obj ** other` |

---

## 8. Bitwise — 6 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__and__(self, other)` | `def __and__(self, o): return self.val & o.val - new` — `obj & other` |
| `__or__(self, other)` | `def __or__(self, o): return self.val \| o.val - new` — `obj \| other` |
| `__xor__(self, other)` | `def __xor__(self, o): return self.val ^ o.val - new` — `obj ^ other` |
| `__invert__(self)` | `def __invert__(self): return ~self.val - new` — `~obj` (unario) |
| `__lshift__(self, other)` | `def __lshift__(self, o): return self.val << o.val - new` — `obj << other` |
| `__rshift__(self, other)` | `def __rshift__(self, o): return self.val >> o.val - new` — `obj >> other` |

---

## 9. Unary — 3 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__neg__(self)` | `def __neg__(self): return -self.val - new` — `-obj` |
| `__pos__(self)` | `def __pos__(self): return +self.val - new` — `+obj` |
| `__abs__(self)` | `def __abs__(self): return abs(self.val) - new` — `abs(obj)` |

---

## 10. Conversion — 8 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__int__(self)` | `def __int__(self): return int(self.val) - int` — `int(obj)` |
| `__float__(self)` | `def __float__(self): return float(self.val) - float` — `float(obj)` |
| `__complex__(self)` | `def __complex__(self): return complex(self.val) - complex` — `complex(obj)` |
| `__index__(self)` | `def __index__(self): return self.val - int` — Para slicing: `obj[self:]` (debe retornar int exacto) |
| `__round__(self, ndigits=None)` | `def __round__(self, n=0): return round(self.val, n) - number` — `round(obj, 2)` |
| `__ceil__(self)` | `def __ceil__(self): return math.ceil(self.val) - int` — `math.ceil(obj)` |
| `__floor__(self)` | `def __floor__(self): return math.floor(self.val) - int` — `math.floor(obj)` |
| `__trunc__(self)` | `def __trunc__(self): return math.trunc(self.val) - int` — `math.trunc(obj)` |

---

## 11. Other — 6 métodos

| Método | Firma + Ejemplo |
|--------|-----------------|
| `__copy__(self)` | `def __copy__(self): return MyClass(self.val) - shallow copy` — `copy.copy(obj)` |
| `__deepcopy__(self, memo)` | `def __deepcopy__(self, memo): return MyClass(copy.deepcopy(self.val, memo)) - deep copy` — `copy.deepcopy(obj)` |
| `__sizeof__(self)` | `def __sizeof__(self): return self.data.__sizeof__() - int` — `sys.getsizeof(obj)` |
| `__dir__(self)` | `def __dir__(self): return ['x', 'y'] - list` — `dir(obj)` (personaliza autocompletado) |
| `__class__` | `obj.__class__ - <class 'MiClase'>` — Referencia a la clase (atributo, no método) |
| `__mro__` | `MiClase.__mro__ - (MiClase, Parent, object)` — Orden de resolución de métodos (atributo de clase) |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Lifecycle - `__new__` crea, `__init__` inicializa, `__del__` destruye
```python
class Foo:
    def __new__(cls, x):          # crea instancia
        obj = super().__new__(cls)
        return obj
    def __init__(self, x):         # inicializa atributos
        self.x = x
    def __del__(self):             # - None, GC lo llama
        pass
```

### Patrón 2: String - `__repr__` para debug, `__str__` para usuarios
```python
def __repr__(self): return f"Point({self.x}, {self.y})"  # sin ambigüedad
def __str__(self): return f"({self.x}, {self.y})"         # legible
def __format__(self, spec): return format(self.x, spec)   # f-string
```

### Patrón 3: Comparison - define `__eq__` + `__lt__`, usa `@total_ordering`
```python
from functools import total_ordering

@total_ordering
class Item:
    def __eq__(self, o): return self.val == o.val
    def __lt__(self, o): return self.val < o.val
    # __le__, __gt__, __ge__ se generan automáticamente
    def __hash__(self): return hash(self.val)  # obligatorio si __eq__
```

### Patrón 4: Container - protocolo completo con 5 métodos
```python
class Bag:
    def __len__(self): return len(self.items)       # len(bag)
    def __getitem__(self, k): return self.items[k]  # bag[k]
    def __setitem__(self, k, v): self.items[k] = v  # - None
    def __delitem__(self, k): del self.items[k]      # - None
    def __iter__(self): return iter(self.items)       # for x in bag
    def __contains__(self, x): return x in self.items # x in bag
```

### Patrón 5: Arithmetic - siempre retorna NUEVO objeto, nunca muta
```python
def __add__(self, o): return Vec(self.x + o.x, self.y + o.y)  # - new
# Variantes reflejadas: __radd__, __rsub__, etc. (other + self)
# In-place: __iadd__, __isub__, etc. (self += other - puede mutar)
```

### Patrón 6: Context - siempre retorna self en `__enter__`
```python
class DBConn:
    def __enter__(self): return self          # with DBConn() as db:
    def __exit__(self, exc_t, exc_v, exc_tb):  # - None (o True para suprimir)
        self.close()
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Qué dunder method hace que una instancia sea invocable como función? ___________
2. ¿Cuál es la diferencia entre __repr__ y __str__? ___________
3. ¿Qué método debes definir para que `obj[key] = value` funcione? ___________
4. ¿Cómo suprimes una excepción dentro de un context manager? ___________
5. ¿Qué decorador genera __le__, __gt__, __ge__ a partir de __eq__ y __lt__? ___________
```

---

**Total métodos:** 54 (listados) | **Meta de memorización:** 3 días (8-10 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 12 del plan Python Mastery*