INTRODUCCIÓN
Son demasiados modelos en OpenCode Go y me queda a mí la tarea de asignación
de modelos a los diferentes roles de oh-my-openagent. Quiero poner modelos
capaces en cada puesto pero maximizando la cantidad de llamadas que voy a
poder hacer cada mes con la bolsa de la suscripción de OpenCode Go.

METODOLOGÍA
1. Darle a Claude:
   - OpenRouter: Top 20 Agentic Index Score
   - OpenRouter: Top 20 Coding Index Score
   - OpenRouter: Top 20 Throughput Index (con precios)
   - OpenCode Go: tabla de requests/mes por modelo (con estimados de tokens)
   - switch2go.sh actual (para contexto de la config vigente)

   Nota: Intelligence Index Score NO es prioritario para este caso de uso.
   Agentic > Coding > Intelligence para vibe coding con Python/FastAPI en
   modo multi-agente.

2. Identificar los modelos disponibles en Go que aparecen en los índices:
   - Cruza la tabla de Go con los Top 20 de cada índice.
   - Los modelos que aparecen en benchmarks tienen calidad respaldada por
     datos. Los que no aparecen son incógnitas.
   - Prioriza modelos con presencia en múltiples índices (ej. MiMo-V2.5-Pro
     aparece en Agentic #7 y Coding #18: doble validación).

3. Clasificar los roles de OMO en dos grupos:

   GRUPO A — Roles de razonamiento/arquitectura (pocas llamadas, alta calidad):
     prometheus, atlas, hephaestus, multimodal-looker, category/deep
     → Asignar el modelo con mejor score en Agentic/Coding que tenga la
       mayor bolsa de llamadas dentro de su tier.

   GRUPO B — Roles de volumen/mecánicos (muchas llamadas, calidad suficiente):
     sisyphus, sisyphus-junior, momus, oracle, explore, librarian, metis
     y categorías: quick, ultrabrain, unspecified-low/high, visual-engineering,
     artistry, writing
     → Asignar el modelo con más llamadas/mes que aún tenga presencia en
       algún benchmark. Nunca elegir a ciegas por precio sin respaldo de índice.

4. El criterio de desempate entre modelos similares en score:
   - Más llamadas/mes gana siempre.
   - Si las llamadas son similares (diferencia < 15%), gana el mejor score.
   - Nunca sacrificar más de 3 puntos de score para ganar llamadas en Grupo A.
   - En Grupo B, el score mínimo aceptable es aparecer en algún Top 20.

5. Validar que los DEEP_* estén correctos:
   - DEEP_TERMINAL y DEEP_JUNIOR → modelo de mayor volumen (Grupo B)
   - DEEP_GENIUS → modelo de mayor score (Grupo A)
   - DEEP_BRO → modelo de mayor volumen (Grupo B)

6. Actualizar switch2go.sh con los nuevos mappings y documentar el razonamiento
   en los comentarios inline (# Xk/mes — motivo).

CUÁNDO REVISAR
- Cuando OpenCode Go actualice su catálogo o bolsas de llamadas.
- Cuando algún modelo suba/baje más de 2 posiciones en Agentic o Coding Index.
- Cuando aparezca un modelo nuevo en Go que no estaba antes.
- Regla práctica: revisar cada 2-3 meses o cuando salte la web alert.

LECCIÓN APRENDIDA
Más parámetros (ej. 120B) no implica mejor modelo. MiMo-V2.5-Pro de Xiaomi
supera a modelos mucho más grandes en Agentic Index porque está especializado
y bien entrenado para tool use y tareas encadenadas. Siempre confiar en el
benchmark relevante sobre el número de parámetros.

El modo multi-agente de OMO con roles especializados compensa calidad
individual: un modelo "suficientemente bueno" en un rol muy acotado trabaja
mejor que un modelo "brillante" sin contexto especializado.