# Referencia de Tiles - bckTileset

**Sprite:** `bckTileset` (32x32px, 20 sub-imágenes, índices 0-19)
**Proyecto:** Kinal - Between Worlds
**Propósito:** Placeholder para el generador procedural de mazmorras

---

## Mapa de Sub-imágenes

| Índice | Uso en generador | Descripción visual (completar al inspeccionar en IDE) |
|--------|------------------|------------------------------------------------------|
| 0      | *(no usado)*     |                                                      |
| 1      | **Pared** (`1`)  |                                                      |
| 2      | **Suelo A** (`2`)|                                                      |
| 3      | **Suelo B** (`3`)|                                                      |
| 4      | *(no usado)*     |                                                      |
| 5      | *(no usado)*     |                                                      |
| 6      | *(no usado)*     |                                                      |
| 7      | *(no usado)*     |                                                      |
| 8      | *(no usado)*     |                                                      |
| 9      | *(no usado)*     |                                                      |
| 10     | **Árbol A** (`10`)|                                                     |
| 11     | **Árbol B** (`11`)|                                                     |
| 12     | *(no usado)*     |                                                      |
| 13     | *(no usado)*     |                                                      |
| 14     | *(no usado)*     |                                                      |
| 15     | **Cofre base** (`15`)|                                                   |
| 16     | **Cofre tapa** (`16`)|                                                   |
| 17     | **Objeto/mostrador** (`17`)|                                              |
| 18     | *(no usado)*     |                                                      |
| 19     | **Arbusto/altar** (`19`)|                                                  |

---

## Convenciones del Generador

| Tile ID | Significado              | Capa       | Colisión |
|---------|--------------------------|------------|----------|
| `0`     | Vacío / no dibujar       | -          | No       |
| `1`     | Pared                    | `walls`    | Sí       |
| `2`     | Suelo variante A         | `floor`    | No       |
| `3`     | Suelo variante B         | `floor`    | No       |
| `10`    | Decoración árbol A       | `deco`     | No       |
| `11`    | Decoración árbol B       | `deco`     | No       |
| `15`    | Decoración cofre base    | `deco`     | No       |
| `16`    | Decoración cofre tapa    | `deco`     | No       |
| `17`    | Decoración objeto        | `deco`     | No       |
| `19`    | Decoración arbusto/altar | `deco`     | No       |

---

## Cómo editar los templates

Los templates de habitaciones están en `datafiles/templates/rooms.json`.
Cada template tiene esta estructura:

```json
{
  "id": "nombre_unico",
  "type": "start|normal|treasure|shop|event|boss",
  "w": 9,           // ancho en tiles (múltiplo impar recomendado)
  "h": 7,           // alto en tiles
  "floor":  [[...]],  // array 2D: 0=vacío, 2/3=suelo
  "walls":  [[...]],  // array 2D: 0=abierto, 1=pared
  "deco":   [[...]],  // array 2D: 0=nada, 10/11/15/16/17/19=decoración
  "doors": [{"x":4,"y":6,"dir":"S"}],  // puntos de conexión
  "enemies": []        // (reservado para futuro)
}
```

**Reglas:**
- Las paredes (1) siempre forman un borde completo alrededor de la habitación
- Las puertas (0 en la pared) están en `doors[]` y son huecos en el borde
- El suelo (2, 3) llena el interior
- La decoración (10+) va sobre el suelo
- `w` y `h` deben coincidir con las dimensiones de los arrays
