# P01 - Python Built-in Functions (71 funciones)

> Objetivo: Memorizar todas las funciones built-in de Python por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Conversión de Tipos (Casting) — 11 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `bool()` | `bool(1) - True` — Convierte a booleano |
| `int()` | `int("42") - 42` — Convierte a entero |
| `float()` | `float("3.14") - 3.14` — Convierte a flotante |
| `str()` | `str(42) - "42"` — Convierte a string |
| `list()` | `list("abc") - ['a','b','c']` — Convierte a lista |
| `tuple()` | `tuple([1,2]) - (1,2)` — Convierte a tupla |
| `set()` | `set([1,1,2]) - {1,2}` — Convierte a conjunto |
| `frozenset()` | `frozenset([1,2])` — Conjunto inmutable |
| `dict()` | `dict([('a',1)]) - {'a':1}` — Crea diccionario |
| `bytes()` | `bytes("hi", 'utf-8')` — Convierte a bytes |
| `bytearray()` | `bytearray(b"hi")` — Array de bytes mutable |

---

## 2. Matemáticas y Números — 10 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `abs()` | `abs(-5) - 5` — Valor absoluto |
| `round()` | `round(3.1415, 2) - 3.14` — Redondea a N decimales |
| `divmod()` | `divmod(10, 3) - (3, 1)` — División + módulo |
| `pow()` | `pow(2, 3) - 8` — Potencia (acepta mod) |
| `sum()` | `sum([1,2,3]) - 6` — Suma iterable |
| `min()` | `min([3,1,2]) - 1` — Mínimo (con `key=`) |
| `max()` | `max([3,1,2]) - 3` — Máximo (con `key=`) |
| `bin()` | `bin(5) - '0b101'` — Binario con prefijo |
| `oct()` | `oct(8) - '0o10'` — Octal con prefijo |
| `hex()` | `hex(255) - '0xff'` — Hexadecimal con prefijo |

---

## 3. Secuencias y Colecciones — 9 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `len()` | `len("abc") - 3` — Longitud de objeto |
| `range()` | `range(0, 10, 2) - 0,2,4,6,8` — Rango numérico |
| `slice()` | `slice(1, 5, 2)` — Objeto slice |
| `sorted()` | `sorted([3,1,2]) - [1,2,3]` — Ordena (nueva lista) |
| `reversed()` | `list(reversed([1,2,3])) - [3,2,1]` — Iterador invertido (envolver en list() para ver valores) |
| `enumerate()` | `enumerate(['a','b']) - (0,'a'), (1,'b')` — Con índice |
| `zip()` | `zip([1,2], ['a','b']) - (1,'a'), (2,'b')` — Empareja |
| `map()` | `list(map(str, [1,2])) - ['1','2']` — Aplica función a cada elemento (devuelve iterador) |
| `filter()` | `list(filter(bool, [0,1,2])) - [1,2]` — Filtra con predicado (devuelve iterador) |

---

## 4. Iteración y Generadores — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `iter()` | `iter([1,2,3])` — Crea iterador |
| `next()` | `next(it, default)` — Próximo elemento |
| `memoryview()` | `memoryview(b'abc')` — Vista de memoria |

---

## 5. Atributos, Propiedades y Metadatos — 6 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `getattr()` | `getattr(obj, 'x', default)` — Obtiene atributo |
| `setattr()` | `setattr(obj, 'x', 42)` — Establece atributo |
| `delattr()` | `delattr(obj, 'x')` — Elimina atributo |
| `hasattr()` | `hasattr(obj, 'x') - True` — Verifica atributo |
| `dir()` | `dir(obj)` — Lista atributos/métodos |
| `vars()` | `vars(obj)` - `__dict__` — Diccionario de atributos |

---

## 6. Strings y Representación — 7 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `ascii()` | `ascii("ñ") - '\\xf1'` — Escapa no-ASCII |
| `repr()` | `repr("hi") - '"hi"'` — Representación canónica |
| `format()` | `format(3.14, ".2f") - '3.14'` — Formatea con especificación |
| `chr()` | `chr(97) - 'a'` — Entero a carácter |
| `ord()` | `ord('a') - 97` — Carácter a entero |
| `str()` | (Ver sección 1) |
| `print()` | `print("hi", end="")` — Salida a stdout |

---

## 7. Booleanos, Comparación y Lógica — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `all()` | `all([1,1,0]) - False` — True si todos son truthy |
| `any()` | `any([0,0,1]) - True` — True si alguno es truthy |
| `callable()` | `callable(len) - True` — ¿Es invocable? |
| `hash()` | `hash("abc") - -123456` — Hash del objeto |

---

## 8. Identidad y Tipos — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `type()` | `type(42) - <class 'int'>` — Tipo del objeto |
| `isinstance()` | `isinstance(42, int) - True` — Verifica instancia |
| `issubclass()` | `issubclass(bool, int) - True` — Verifica subclase |
| `id()` | `id(obj) - 140234...` — Identidad única en memoria |

---

## 9. Entrada/Salida — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `input()` | `input("Nombre: ") - "Ana"` — Lee línea de stdin |
| `print()` | (Ver sección 6) |
| `open()` | `open("file.txt", "r", encoding="utf-8")` — Abre archivo |

---

## 10. Ejecución y Evaluación — 5 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `eval()` | `eval("1 + 2") - 3` — Evalúa expresión string |
| `exec()` | `exec("x = 1 + 2")` — Ejecuta código string |
| `compile()` | `compile("1+2", "", "eval")` — Compila a bytecode |
| `globals()` | `globals()` - `{...}` — Diccionario de vars globales |
| `locals()` | `locals()` - `{...}` — Diccionario de vars locales |

---

## 11. Importación y Reflexión — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `__import__()` | `__import__('os')` — Importa módulo dinámicamente |
| `importlib.import_module()` | (No built-in, usar `__import__`) |
| `help()` | `help(str.upper)` — Documentación interactiva |

---

## 12. Clases y Decoradores Built-in — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `classmethod()` | `def f(cls): ...` - `@classmethod` — Método de clase |
| `staticmethod()` | `def f(): ...` - `@staticmethod` — Método estático |
| `property()` | `@property` + `@x.setter` — Getter/setter |
| `super()` | `super().__init__()` — Accede a clase padre |

---

## 13. Misceláneos — 2 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `object()` | `object()` — Objeto base más simple |
| `breakpoint()` | `breakpoint()` — Entra en PDB (debugger) |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Conversión de tipos - recuerda que **todas son constructores**
```python
bool(), int(), float(), str(), list(), tuple(), set(), frozenset(), dict(), bytes(), bytearray()
```

### Patrón 2: Secuencias - recuerda la familia de herramientas de iteración
```python
len(), range(), enumerate(), zip(), map(), filter(), sorted(), reversed()
```

### Patrón 3: Objetos y atributos - recuerda la familia de reflexión
```python
dir(), vars(), getattr(), setattr(), delattr(), hasattr(), type(), isinstance(), issubclass()
```

### Patrón 4: Matemáticas - recuerda que casi todas aceptan `key=` excepto `abs`, `divmod`, `pow`
```python
abs(), round(), divmod(), pow(), sum(), min(), max()
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cuál función convierte a binario con prefijo '0b'? ___________
2. ¿Qué devuelve divmod(10, 3)? ___________
3. ¿Cómo obtienes el diccionario de atributos de un objeto? ___________
4. ¿Cuál es la diferencia entre eval() y exec()? ___________
5. ¿Qué función verifica si un objeto es instancia de un tipo? ___________
```

---

**Total funciones:** 71 | **Meta de memorización:** 3 días (10-15 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 1 de 28 del plan Python Mastery*
