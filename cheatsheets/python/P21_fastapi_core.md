# P21 - FastAPI Core (~25 funciones)

> Objetivo: Memorizar las funciones y componentes centrales de FastAPI por familia.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. App Setup — 5 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `FastAPI()` | `app = FastAPI(title="API", version="1.0")` — Crea la aplicación |
| `app.include_router()` | `app.include_router(user_router, prefix="/users")` — Incluye un router |
| `app.mount()` | `app.mount("/static", StaticFiles(directory="static"))` — Monta sub-aplicación |
| `lifespan` | `@asynccontextmanager\ndef lifespan(app): yield` — Startup/shutdown events |
| `middleware` | `@app.middleware("http")\nasync def mw(request, call_next): ...` — Middleware global |

---

## 2. Decoradores de Ruta — 6 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `@app.get` | `@app.get("/items/{id}")\nasync def get_item(id: int): ...` — Ruta GET |
| `@app.post` | `@app.post("/items/")\nasync def create_item(item: Item): ...` — Ruta POST |
| `@app.put` | `@app.put("/items/{id}")\nasync def update_item(id: int, item: Item): ...` — Ruta PUT |
| `@app.delete` | `@app.delete("/items/{id}")\nasync def delete_item(id: int): ...` — Ruta DELETE |
| `@app.patch` | `@app.patch("/items/{id}")\nasync def patch_item(id: int, item: dict): ...` — Ruta PATCH |
| `@app.websocket` | `@app.websocket("/ws")\nasync def ws_endpoint(websocket: WebSocket): ...` — WebSocket |

---

## 3. Respuestas — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `Response` | `return Response(content="ok", status_code=200, media_type="text/plain")` — Respuesta cruda |
| `JSONResponse` | `return JSONResponse(content={"msg": "ok"}, status_code=200)` — Respuesta JSON directa |
| `FileResponse` | `return FileResponse("report.pdf", filename="report.pdf")` — Sirve archivo estático |
| `StreamingResponse` | `return StreamingResponse(generate(), media_type="text/csv")` — Respuesta en streaming |

---

## 4. Request y Datos de Entrada — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `Request` | `async def handler(request: Request): ua = request.headers["user-agent"]` — Objeto request completo |
| `Form` | `username: str = Form(...), password: str = Form(...)` — Campo de formulario |
| `File` | `file: bytes = File(...)` — Archivo como bytes crudos |
| `UploadFile` | `file: UploadFile = File(...); content = await file.read()` — Archivo con metadatos |

---

## 5. Errores y Status — 2 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `HTTPException` | `raise HTTPException(status_code=404, detail="Not found")` — Lanza error HTTP |
| `status.*` | `status.HTTP_200_OK`, `status.HTTP_404_NOT_FOUND`, `status.HTTP_422_UNPROCESSABLE_ENTITY` — Constantes de status |

---

## 6. Utilidades — 5 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `BackgroundTasks` | `def handler(bg: BackgroundTasks): bg.add_task(send_email, to="a@b.com")` — Tareas en background |
| `Security` | `user = Security(get_current_user, scopes=["read"])` — Dependencia con scopes de seguridad |
| `APIRouter()` | `router = APIRouter(prefix="/items", tags=["items"])` — Crea router modular |
| `Depends()` | `def handler(db: Session = Depends(get_db)): ...` — Inyección de dependencias |
| `Path()` | `id: int = Path(ge=1, description="Item ID")` — Validación y metadatos de path param |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: App setup - recuerda el orden de composición
```python
FastAPI() - include_router() - mount() - lifespan - middleware
```

### Patrón 2: Decoradores de ruta - recuerda los 5 métodos HTTP + websocket
```python
@app.get, @app.post, @app.put, @app.delete, @app.patch, @app.websocket
```

### Patrón 3: Respuestas - recuerda la jerarquía de abstracción
```python
Response (cruda) - JSONResponse (JSON) - FileResponse (archivo) - StreamingResponse (stream)
```

### Patrón 4: Datos de entrada - recuerda la progresión de complejidad
```python
Request (completo) - Form (formulario) - File (bytes) - UploadFile (con metadatos)
```

### Patrón 5: Utilidades - recuerda que Depends y Path son las dos dependencias más usadas
```python
Depends(get_db)  # inyección de dependencias
Path(ge=1)       # validación de path params
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cómo creas una app FastAPI con título y versión? ___________
2. ¿Qué decorador usas para una ruta PATCH? ___________
3. ¿Qué respuesta usas para servir un archivo PDF? ___________
4. ¿Cómo lanzas un error 404 con mensaje? ___________
5. ¿Cuál es la diferencia entre File y UploadFile? ___________
6. ¿Cómo añades una tarea en background? ___________
7. ¿Cómo inyectas una dependencia en un endpoint? ___________
8. ¿Qué función valida un path param con ge=1? ___________
```

---

**Total funciones:** ~25 | **Meta de memorización:** 3 días (8-10 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 21 de 28 del plan Python Mastery*