# P24 - SQLAlchemy para FastAPI (~30 funciones)

> Objetivo: Memorizar las funciones/clases clave de SQLAlchemy para FastAPI por categoría.
> Método: Cubre la columna derecha, intenta recordar la firma + ejemplo antes de voltear.

---

## 1. Engine & Configuración — 6 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `create_engine()` | `engine = create_engine("sqlite:///db.sqlite3")` — Crea motor síncrono |
| `sessionmaker()` | `SessionLocal = sessionmaker(bind=engine, autocommit=False)` — Fábrica de sesiones |
| `SessionLocal` | `db = SessionLocal()` — Instancia una sesión del motor |
| `declarative_base()` | `Base = declarative_base()` — Base para modelos (estilo legacy) |
| `DeclarativeBase` | `class Base(DeclarativeBase): pass` — Base para modelos (estilo 2.0+) |
| `create_async_engine()` | `engine = create_async_engine("sqlite+aiosqlite:///db.sqlite3")` — Motor asíncrono |

---

## 2. Sesión & CRUD — 8 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `session.add()` | `session.add(user)` — Agrega objeto a la sesión (pendiente commit) |
| `session.commit()` | `session.commit()` — Persiste cambios en la BD |
| `session.rollback()` | `session.rollback()` — Revierte cambios no commitados |
| `session.query()` | `session.query(User).filter_by(name="Ana").first()` — Query estilo legacy |
| `session.execute()` | `session.execute(select(User).where(User.name == "Ana"))` — Ejecuta statement 2.0 |
| `session.refresh()` | `session.refresh(user)` — Recarga objeto desde la BD (post-commit) |
| `session.delete()` | `session.delete(user)` — Marca objeto para eliminación |
| `session.close()` | `session.close()` — Cierra la sesión (libera conexión) |

---

## 3. ORM: Modelos & Columnas — 10 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `Base` | `class User(Base): __tablename__ = "users"` — Clase base declarativa |
| `Column()` | `id = Column(Integer, primary_key=True)` — Define columna (estilo legacy) |
| `Integer` | `age = Column(Integer)` — Tipo entero de BD |
| `String()` | `name = Column(String(50))` — Tipo string con longitud |
| `Boolean` | `active = Column(Boolean, default=True)` — Tipo booleano |
| `DateTime` | `created = Column(DateTime, default=func.now())` — Tipo fecha/hora |
| `Float` | `price = Column(Float)` — Tipo flotante |
| `ForeignKey()` | `user_id = Column(Integer, ForeignKey("users.id"))` — Clave foránea |
| `mapped_column()` | `name: Mapped[str] = mapped_column(String(50))` — Columna tipada (estilo 2.0+) |
| `Mapped[]` | `name: Mapped[str]` — Anotación de tipo para columna ORM |

---

## 4. ORM: Relaciones & Consultas — 5 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `relationship()` | `posts = relationship("Post", back_populates="author")` — Define relación ORM |
| `back_populates` | `author = relationship("User", back_populates="posts")` — Nombre inverso de relación |
| `select()` | `stmt = select(User).where(User.id == 1)` — Construye query (estilo 2.0) |
| `joinedload()` | `select(User).options(joinedload(User.posts))` — Carga ansiosa con JOIN |
| `selectinload()` | `select(User).options(selectinload(User.posts))` — Carga ansiosa con SELECT IN |

---

## 5. Async — 2 funciones

| Función | Firma + Ejemplo |
|---------|-----------------|
| `AsyncSession` | `async with AsyncSession(engine) as session:` — Sesión asíncrona |
| `async def` | `async def get_user(db: AsyncSession, id: int):` — Endpoint async con sesión |

---

## 🧠 Patrones Clave para Memorizar

### Patrón 1: Setup síncrono - engine + sessionmaker + Base
```python
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

engine = create_engine("sqlite:///db.sqlite3")
SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)
Base = declarative_base()
```

### Patrón 2: Setup asíncrono - async_engine + AsyncSession + DeclarativeBase
```python
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column

engine = create_async_engine("sqlite+aiosqlite:///db.sqlite3")
class Base(DeclarativeBase): pass
```

### Patrón 3: CRUD session - add - commit - refresh
```python
session.add(user)      # marca para insertar
session.commit()       # persiste en BD
session.refresh(user)  # recarga defaults (id, timestamps)
```

### Patrón 4: Query 2.0 - select + where + execute + scalars
```python
stmt = select(User).where(User.name == "Ana")
result = session.execute(stmt)
users = result.scalars().all()
```

### Patrón 5: Dependencia FastAPI - yield session
```python
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
```

---

## ✍️ Espacio de Práctica (escribe de memoria)

```
1. ¿Cómo creas un engine asíncrono para SQLite? ___________
2. ¿Qué función marca un objeto para eliminación sin borrarlo de inmediato? ___________
3. ¿Cuál es la diferencia entre joinedload y selectinload? ___________
4. ¿Cómo defines una relación bidireccional entre User y Post? ___________
5. ¿Qué hace session.refresh() después de un commit? ___________
6. ¿Cuál es el estilo 2.0 para definir columnas con tipos? ___________
7. ¿Cómo reviertes cambios no commitados? ___________
8. ¿Qué patrón usas para inyectar la sesión en FastAPI? ___________
```

---

**Total funciones:** 31 | **Meta de memorización:** 3 días (8-10 por sesión)
**Refuerzos:** Día +7, +30, +90

---

*Archivo 24 de 28 del plan Python Mastery*