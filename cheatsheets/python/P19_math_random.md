# P19 - Python math, random & statistics (~25 funciones)

> Objetivo: Memorizar funciones de math, random y statistics por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Redondeo y Truncado — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `math.ceil()` | `math.ceil(4.2) - 5` — Redondea hacia arriba |
| `math.floor()` | `math.floor(4.8) - 4` — Redondea hacia abajo |
| `math.trunc()` | `math.trunc(-3.7) - -3` — Trunca hacia cero |

---

## 2. Potencia y Logaritmos — 6 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `math.sqrt()` | `math.sqrt(16) - 4.0` — Raíz cuadrada |
| `math.pow()` | `math.pow(2, 3) - 8.0` — Potencia (siempre float) |
| `math.log()` | `math.log(math.e) - 1.0` — Logaritmo natural (base e) |
| `math.log10()` | `math.log10(100) - 2.0` — Logaritmo base 10 |
| `math.log2()` | `math.log2(8) - 3.0` — Logaritmo base 2 |
| `math.exp()` | `math.exp(1) - 2.7182...` — e elevado a x |

---

## 3. Trigonometría — 3 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `math.sin()` | `math.sin(math.pi / 2) - 1.0` — Seno (radianes) |
| `math.cos()` | `math.cos(0) - 1.0` — Coseno (radianes) |
| `math.tan()` | `math.tan(math.pi / 4) - 1.0` — Tangente (radianes) |

---

## 4. Constantes — 4 valores

| Constante | Firma + Ejemplo |
|-----------|-----------------|
| `math.pi` | `math.pi - 3.14159265...` — π |
| `math.e` | `math.e - 2.71828182...` — Número de Euler |
| `math.inf` | `math.inf - inf` — Infinito positivo |
| `math.nan` | `math.nan - nan` — Not a Number |

---

## 5. Comparación — 1 función

| Función | Firma + Ejemplo |
|---------|-----------------|
| `math.isclose()` | `math.isclose(0.1 + 0.2, 0.3) - True` — Compara con tolerancia |

---

## 6. random — Generación Aleatoria — 6 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `random.random()` | `random.random() - 0.374...` — Float entre 0.0 y 1.0 |
| `random.randint()` | `random.randint(1, 6) - 4` — Entero entre a y b (inclusive) |
| `random.choice()` | `random.choice(['a','b','c']) - 'b'` — Elige un elemento |
| `random.shuffle()` | `random.shuffle(lst)` — Mezcla lista in-place (None) |
| `random.sample()` | `random.sample(lst, 2) - ['b','a']` — K elementos sin reemplazo |
| `random.seed()` | `random.seed(42)` — Fija semilla para reproducibilidad |

---

## 7. statistics — Estadística Descriptiva — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `statistics.mean()` | `statistics.mean([1, 2, 3]) - 2` — Media aritmética |
| `statistics.median()` | `statistics.median([1, 2, 3]) - 2` — Mediana |
| `statistics.mode()` | `statistics.mode([1, 1, 2]) - 1` — Moda (más frecuente) |
| `statistics.stdev()` | `statistics.stdev([1, 2, 3]) - 1.0` — Desviación estándar muestral |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Redondeo - ceil sube, floor baja, trunc va a cero
```python
math.ceil(4.2)   - 5    # siempre hacia +∞
math.floor(4.8)  - 4    # siempre hacia -∞
math.trunc(-3.7) - -3   # siempre hacia 0
```

### Patrón 2: Logaritmos - base implícita vs explícita
```python
math.log(x)     # base e (natural)
math.log10(x)   # base 10
math.log2(x)    # base 2
math.log(x, b)  # base personalizada
```

### Patrón 3: random - tres modos de elegir
```python
random.choice(seq)   # 1 elemento
random.sample(seq, k)  # k elementos sin repetir
random.shuffle(seq)    # mezclar todo in-place
```

### Patrón 4: statistics - las 4 medidas centrales/dispersión
```python
statistics.mean()    # promedio
statistics.median()  # valor central
statistics.mode()    # más frecuente
statistics.stdev()   # dispersión muestral
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Qué función redondea hacia arriba? ___________
2. ¿Cuál es la diferencia entre math.pow(2,3) y 2**3? ___________
3. ¿Qué devuelve math.log(math.e)? ___________
4. ¿Cómo generas un entero aleatorio entre 1 y 10 inclusive? ___________
5. ¿Qué función comparación evita errores de punto flotante? ___________
6. ¿Cuál es la diferencia entre random.choice y random.sample? ___________
7. ¿Qué devuelve statistics.stdev([2, 2, 2])? ___________
```

---

**Total funciones:** 27 | **Meta de memorización:** 3 días (9 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 19 de 28 del plan Python Mastery*