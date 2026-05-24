# P22 - FastAPI Dependencies & Validation (~20 funciones)

> Objetivo: Memorizar las funciones y patrones clave de FastAPI para validación de parámetros, inyección de dependencias y seguridad.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Validación de Parámetros (Path & Query) — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `Path()` | `id: int = Path(gt=0, le=100)` — Valida parámetro de ruta con restricciones |
| `Query()` | `q: str = Query(min_length=2, max_length=50)` — Valida query param con restricciones |
| `Header()` | `token: str = Header(alias="X-Token")` — Extrae y valida header HTTP |
| `Cookie()` | `session: str = Cookie(alias="sid")` — Extrae y valida cookie por nombre |

---

## 2. Validación de Cuerpo y Formularios — 4 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `Body()` | `item: Item = Body(embed=True, examples={...})` — Valida cuerpo JSON con opciones |
| `Form()` | `username: str = Form(max_length=50)` — Extrae campo de form-data |
| `File()` | `file: bytes = File(content_type="image/png")` — Recibe archivo como bytes |
| `UploadFile` | `file: UploadFile` — Archivo con `.filename`, `.content_type`, `.read()` |

---

## 3. Inyección de Dependencias — 5 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `Depends()` | `db: Session = Depends(get_db)` — Inyecta dependencia en endpoint |
| `Annotated` | `DbSession = Annotated[Session, Depends(get_db)]` — Reutiliza tipo con dependencia |
| Clase dependencia | `class CommonQuery: q: str; offset: int = 0` — `deps=Depends(CommonQuery)` |
| Sub-dependencias | `def get_user(db=Depends(get_db)): ...` — Dependencia que usa otra dependencia |
| Dependencias globales | `app = FastAPI(dependencies=[Depends(verify_token)])` — Aplica a todos los endpoints |

---

## 4. Seguridad y Autenticación — 5 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `Security()` | `user: User = Security(get_current_user, scopes=["admin"])` — Como Depends pero con scopes |
| `HTTPBearer` | `security = HTTPBearer(); creds = Depends(security)` — Autenticación Bearer token |
| `HTTPBasic` | `security = HTTPBasic(); creds = Depends(security)` — Autenticación Basic (user+pass) |
| `OAuth2PasswordBearer` | `oauth2 = OAuth2PasswordBearer(tokenUrl="token")` — Esquema OAuth2 para Swagger UI |
| `HTTPException` | `raise HTTPException(status_code=401, detail="No auth")` — Error HTTP desde dependencia |

---

## 5. Utilidades de Request — 2 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `Request` | `req: Request` — Acceso directo al objeto request (headers, client, state) |
| `BackgroundTasks` | `tasks: BackgroundTasks; tasks.add(send_email, user)` — Tareas en background |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Parameter family - todas validan entrada con restricciones
```python
Path(gt=0), Query(min_length=1), Header(alias="X-Auth"), Cookie(alias="sid")
Form(max_length=50), File(content_type="image/png"), Body(embed=True), UploadFile
```

### Patrón 2: Depends - inyección central de FastAPI
```python
# Función dependencia
def get_db(): db = Session(); try: yield db; finally: db.close()

# Uso en endpoint
db: Session = Depends(get_db)

# Annotated para reutilizar
DbSession = Annotated[Session, Depends(get_db)]

# Clase como dependencia (attrs automáticos)
class Pagination: offset: int = 0; limit: int = 100
page: Pagination = Depends()
```

### Patrón 3: Security - Depends + scopes + esquemas Swagger
```python
oauth2 = OAuth2PasswordBearer(tokenUrl="token")
security = HTTPBearer()       # Bearer token
basic = HTTPBasic()            # User + password

# Security() = Depends() con scopes
user: User = Security(get_current_user, scopes=["admin"])
```

### Patrón 4: Sub-dependencias - cadena automática
```python
def get_db() -> Session: ...
def get_user(db: Session = Depends(get_db)) -> User: ...
def get_items(user: User = Depends(get_user)) -> list: ...
# FastAPI resuelve el grafo automáticamente
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cómo validas que un path param sea mayor a 0? ___________
2. ¿Qué función usas para inyectar una dependencia? ___________
3. ¿Cómo creas un tipo reutilizable con dependencia? ___________
4. ¿Qué clase usas para autenticación Bearer? ___________
5. ¿Cómo aplicas una dependencia a TODOS los endpoints? ___________
6. ¿Qué propiedad de UploadFile lees para obtener el contenido? ___________
7. ¿Cuál es la diferencia entre Security() y Depends()? ___________
8. ¿Cómo defines una clase como dependencia sin Depends()? ___________
```

---

**Total funciones:** ~20 | **Meta de memorización:** 3 días (7 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 22 de 28 del plan Python Mastery*