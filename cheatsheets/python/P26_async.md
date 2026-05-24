# P26 - Python Async/Await (~17 funciones)

> Objetivo: Memorizar las construcciones async/await y primitivas de asyncio por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Fundamentos Async — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `async def` | `async def fetch(url): ...` — Declara coroutine |
| `await` | `result = await fetch(url)` — Cede control hasta que coroutine termine |
| `asyncio.run()` | `asyncio.run(main())` — Punto de entrada, ejecuta coroutine principal |
| `asyncio.sleep()` | `await asyncio.sleep(1.0)` — Pausa no bloqueante (cede control al loop) |

---

## 2. Gestión de Tasks — 5 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `asyncio.create_task()` | `t = asyncio.create_task(fetch(url))` — Agenda coroutine como Task concurrente |
| `asyncio.gather()` | `results = await asyncio.gather(*coros)` — Ejecuta coroutines en paralelo, retorna lista de resultados |
| `asyncio.wait()` | `done, pending = await asyncio.wait(tasks, timeout=5)` — Espera conjunto, retorna sets de completadas/pendientes |
| `asyncio.as_completed()` | `for coro in asyncio.as_completed(tasks): result = await coro` — Itera en orden de finalización |
| `asyncio.TaskGroup` | `async with asyncio.TaskGroup() as tg: tg.create_task(fetch(u))` — Context manager, cancela todo si una falla (3.11+) |

---

## 3. Iteración Async — 2 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `async for` | `async for msg in websocket: print(msg)` — Itera sobre async iterator |
| `async with` | `async with aiohttp.ClientSession() as s: ...` — Context manager async (entra/sale con await) |

---

## 4. Sincronización — 6 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `asyncio.Queue()` | `q = asyncio.Queue(maxsize=10); await q.put(item); item = await q.get()` — Queue thread-safe entre coroutines |
| `asyncio.Lock()` | `async with lock: ...` — Mutex async, solo una coroutine a la vez |
| `asyncio.Semaphore()` | `async with asyncio.Semaphore(5): ...` — Limita concurrencia a N coroutines |
| `asyncio.Event()` | `await event.wait(); event.set()` — Señal simple, despierta todos los waiters |
| `asyncio.Condition()` | `async with cond: await cond.wait(); cond.notify_all()` — Event + Lock, notifica selectivamente |
| `asyncio.timeout()` | `async with asyncio.timeout(3.0): await slow_op()` — Cancela coroutine si excede duración (3.11+) |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Flujo async básico - declara, cede, ejecuta
```python
async def main():          # 1. async def declara coroutine
    result = await coro()   # 2. await cede control y espera resultado
asyncio.run(main())         # 3. asyncio.run() es el punto de entrada
```

### Patrón 2: Concurrencia - recuerda la progresión de control
```python
create_task(coro)    # Agenda una sola coroutine
gather(*coros)       # Ejecuta varias, retorna lista de resultados
TaskGroup             # Como gather pero con cancelación automática en error
```

### Patrón 3: Sincronización - recuerda la familia por propósito
```python
Queue()       # Comunicación: productor - consumidor
Lock()        # Exclusión mutua: solo uno pasa
Semaphore(N)  # Exclusión limitada: hasta N pasan
Event()       # Señal: despierta a todos
Condition()   # Señal + Lock: despierta selectivamente
```

### Patrón 4: Iteración async - async paralela a sync
```python
for x in iter:        -  async for x in aiter:
with ctx:             -  async with ctx:
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cómo declaras una coroutine? ___________
2. ¿Qué función es el punto de entrada para ejecutar async? ___________
3. ¿Cuál primitiva ejecuta varias coroutines y retorna lista de resultados? ___________
4. ¿Qué diferencia hay entre asyncio.wait() y asyncio.gather()? ___________
5. ¿Cómo limitas la concurrencia a 5 coroutines simultáneas? ___________
6. ¿Qué primitiva cancela todo el grupo si una coroutine falla? ___________
7. ¿Cuál es el equivalente async de `for x in iter`? ___________
8. ¿Cómo estableces un timeout de 3 segundos sobre una coroutine? ___________
```

---

**Total funciones:** 17 | **Meta de memorización:** 3 días (5-6 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 26 de 28 del plan Python Mastery*