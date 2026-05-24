# P13 - Python Properties, Descriptors & Slots (~10 patrones)

> Objetivo: Dominar el control de acceso a atributos mediante properties, el protocolo descriptor y la optimización de memoria con `__slots__`
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Properties — 3 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `@property` (getter) | `@property` — Convierte método en atributo de solo lectura; se invoca como `obj.attr` sin paréntesis |
| `@x.setter` | `@attr.setter` — Intercepta asignación `obj.attr = valor`; permite validación y side effects |
| `@x.deleter` | `@attr.deleter` — Intercepta `del obj.attr`; útil para limpieza, reset o invalidar caché |

```python
# @property — getter de solo lectura
class Circle:
    def __init__(self, radius):
        self._radius = radius

    @property
    def area(self):
        return 3.1416 * self._radius ** 2

c = Circle(5)
c.area  # - 78.54 (sin paréntesis, como atributo)
```

```python
# @x.setter — validación en escritura
class Circle:
    def __init__(self, radius):
        self.radius = radius  # usa el setter

    @property
    def radius(self):
        return self._radius

    @radius.setter
    def radius(self, value):
        if value < 0:
            raise ValueError("radius must be >= 0")
        self._radius = value

c = Circle(5)
c.radius = 10  # ok
c.radius = -5  # ValueError
```

```python
# @x.deleter — intercepta del
class Config:
    def __init__(self, key):
        self._key = key

    @property
    def key(self):
        return self._key

    @key.deleter
    def key(self):
        self._key = None
        print("key cleared")

cfg = Config("secret")
del cfg.key  # - "key cleared", _key pasa a None
```

---

## 2. Slots — 1 patrón

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `__slots__` | `__slots__ = ('x', 'y')` — Elimina `__dict__` por instancia; ahorra ~40-50% de memoria; impide atributos dinámicos; `obj.z = 3` - `AttributeError` |

```python
# __slots__ básico
class Point:
    __slots__ = ('x', 'y')

    def __init__(self, x, y):
        self.x = x
        self.y = y

p = Point(3, 4)
p.x       # - 3
p.z = 5   # - AttributeError: 'Point' object has no attribute 'z'
```

```python
# __slots__ con herencia
class Base:
    __slots__ = ('id',)

class Child(Base):
    __slots__ = ('name',)  # se suman con la clase base

c = Child()
c.id = 1        # - 1
c.name = "Ana"  # - "Ana"
# Nota: si Base no define __slots__, Child hereda __dict__ y pierdes el ahorro
```

---

## 3. Descriptores — 3 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `__get__(self, instance, owner)` | `def __get__(self, instance, owner): return instance._name.upper()` — Se llama al leer `obj.name`; `instance` es `None` al acceder desde la clase |
| `__set__(self, instance, value)` | `def __set__(self, instance, value): instance._name = value` — Data descriptor; intercepta escritura `obj.name = val` |
| `__delete__(self, instance)` | `def __delete__(self, instance): raise AttributeError("cannot delete")` — Intercepta `del obj.attr` |

```python
# Descriptor con __get__ (non-data descriptor)
class UpperDesc:
    def __get__(self, instance, owner):
        if instance is None:
            return self  # acceso desde la clase
        return instance._name.upper()

class Person:
    name = UpperDesc()
    def __init__(self, name):
        self._name = name

Person.name   # - <__main__.UpperDesc ...> (instance=None)
p = Person("ana")
p.name        # - "ANA"
```

```python
# Data descriptor con __set__ y __set_name__ (3.6+)
class NonNegative:
    def __set_name__(self, owner, name):
        self.storage_name = f'_{name}'  # automático: price - _price

    def __get__(self, instance, owner):
        if instance is None:
            return self
        return getattr(instance, self.storage_name, 0)

    def __set__(self, instance, value):
        if value < 0:
            raise ValueError(f"{self.storage_name[1:]} must be >= 0")
        setattr(instance, self.storage_name, value)

class Item:
    price = NonNegative()
    def __init__(self, price):
        self.price = price

item = Item(10)
item.price = -5  # - ValueError: price must be >= 0
```

```python
# __delete__ — previene eliminación
class Protected:
    def __set_name__(self, owner, name):
        self.storage_name = f'_{name}'

    def __get__(self, instance, owner):
        if instance is None:
            return self
        return getattr(instance, self.storage_name, None)

    def __set__(self, instance, value):
        setattr(instance, self.storage_name, value)

    def __delete__(self, instance):
        raise AttributeError("cannot delete this attribute")

class User:
    email = Protected()

u = User()
u.email = "a@b.com"
del u.email  # - AttributeError: cannot delete this attribute
```

---

## 4. Patrones Avanzados — 3 patrones

| Patrón | Firma + Ejemplo |
|--------|-----------------|
| `@cached_property` | `from functools import cached_property` — Calcula una vez, guarda resultado en `__dict__`; no tiene setter; reemplaza el descriptor tras primera lectura |
| Data vs non-data descriptors | Data descriptor (`__set__`/`__delete__`) gana sobre `__dict__`; non-data descriptor (solo `__get__`) pierde ante `__dict__` |
| Descriptor validator/typed | `__set_name__` + `__set__` con `isinstance(value, expected_type)` — Patrón reutilizable de validación de tipo |

```python
# @cached_property — memoización automática
from functools import cached_property

class Data:
    @cached_property
    def expensive(self):
        print("computing...")
        return sum(range(10**6))

d = Data()
d.expensive  # computing... - 499999500000
d.expensive  # (sin print, usa caché en __dict__)
```

```python
# Data vs non-data descriptors — regla de precedencia
class DataDesc:
    """Data descriptor: define __set__."""
    def __get__(self, inst, owner):
        return "from data descriptor"
    def __set__(self, inst, value):
        inst.__dict__['_data_field'] = value

class NonDataDesc:
    """Non-data descriptor: solo __get__."""
    def __get__(self, inst, owner):
        return "from non-data descriptor"

class Demo:
    data_attr = DataDesc()
    nondata_attr = NonDataDesc()

d = Demo()
d.__dict__['data_attr'] = "en __dict__"
d.__dict__['nondata_attr'] = "en __dict__"

d.data_attr     # - "from data descriptor"  (data descriptor gana)
d.nondata_attr  # - "en __dict__"           (__dict__ gana sobre non-data)
```

```python
# Descriptor reutilizable con validación de tipo
class Typed:
    def __init__(self, expected_type):
        self.expected_type = expected_type

    def __set_name__(self, owner, name):
        self.storage_name = f'_{name}'

    def __get__(self, instance, owner):
        if instance is None:
            return self
        return getattr(instance, self.storage_name, None)

    def __set__(self, instance, value):
        if not isinstance(value, self.expected_type):
            raise TypeError(f"expected {self.expected_type.__name__}")
        setattr(instance, self.storage_name, value)

class User:
    name = Typed(str)
    age = Typed(int)

    def __init__(self, name, age):
        self.name = name
        self.age = age

User("Ana", 30)     # ok
User("Ana", "30")   # - TypeError: expected int
```

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Property - recuerda el trío getter + setter + deleter
```python
class Temperature:
    def __init__(self, celsius=0):
        self.celsius = celsius  # usa el setter

    @property
    def celsius(self):
        return self._celsius

    @celsius.setter
    def celsius(self, value):
        if value < -273.15:
            raise ValueError("below absolute zero")
        self._celsius = value

    @celsius.deleter
    def celsius(self):
        self._celsius = 0

    @property
    def fahrenheit(self):
        return self._celsius * 9 / 5 + 32

t = Temperature(25)
t.celsius       # - 25
t.fahrenheit    # - 77.0
t.celsius = 30  # usa setter, valida
del t.celsius   # usa deleter, reset a 0
```

### Patrón 2: Slots - recuerda que elimina `__dict__` y ahorra memoria
```python
class Point:
    __slots__ = ('x', 'y')

    def __init__(self, x, y):
        self.x = x
        self.y = y

# p.__dict__ - AttributeError  (no existe)
# p.z = 5    - AttributeError  (atributos dinámicos bloqueados)
```

### Patrón 3: Descriptor - recuerda el protocolo __get__ / __set__ / __delete__ + __set_name__
```python
class Range:
    def __init__(self, min_val=None, max_val=None):
        self.min_val = min_val
        self.max_val = max_val

    def __set_name__(self, owner, name):
        self.storage_name = f'_{name}'

    def __get__(self, instance, owner):
        if instance is None: return self
        return getattr(instance, self.storage_name, 0)

    def __set__(self, instance, value):
        if self.min_val is not None and value < self.min_val:
            raise ValueError(f"must be >= {self.min_val}")
        if self.max_val is not None and value > self.max_val:
            raise ValueError(f"must be <= {self.max_val}")
        setattr(instance, self.storage_name, value)

class Exam:
    score = Range(0, 100)
    weight = Range(0.0, 1.0)
```

### Patrón 4: Precedencia - Data descriptor > __dict__ > Non-data descriptor
```python
# property es un data descriptor (tiene __set__)
# los métodos son non-data descriptors (solo __get__)
# Por eso property gana sobre __dict__ y los métodos pierden
```

### Patrón 5: @cached_property - memoización automática en __dict__
```python
from functools import cached_property

class Matrix:
    def __init__(self, data):
        self.data = data

    @cached_property
    def transpose(self):
        return [list(col) for col in zip(*self.data)]

m = Matrix([[1, 2], [3, 4]])
m.transpose  # - [[1, 3], [2, 4]]  (computado)
m.transpose  # - [[1, 3], [2, 4]]  (cacheado, sin recomputar)
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Qué decorador define un getter de solo lectura accesible sin paréntesis? ___________
2. ¿Qué atributo de clase elimina __dict__ y ahorra ~50% de memoria? ___________
3. ¿Cómo se llama el método que intercepta del obj.attr en un descriptor? ___________
4. ¿Qué decorador de functools cachea el resultado en __dict__ tras la primera lectura? ___________
5. ¿Cuál gana en la precedencia de lookup: data descriptor o __dict__? ___________
6. ¿Cómo obtiene un descriptor el nombre del atributo automáticamente desde Python 3.6+? ___________
7. ¿Cuál es la diferencia entre un data descriptor y un non-data descriptor? ___________
8. ¿Qué ocurre si intentas asignar un atributo no declarado en una clase con __slots__? ___________
```

---

**Total patrones:** ~10 | **Meta de memorización:** 2-3 días (4-5 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 13 de 28 del plan Python Mastery*
