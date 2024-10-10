# CI6450 - Entrega-I

Proyecto I de CI6450 - IA para Videojuegos.
Creado en Godot 4.0

### Cómo utilizar
Descargar el [motor](https://godotengine.org) de Godot 4.0 y abrir el proyecto en él.

### Visualización de los algoritmos:

**Algoritmos cinemáticos y dinámicos:**
Escoger el algoritmo dentro de la lista del nodo *character*. En caso de no desear visualizar ninguno, seleccionar opción None.

Lista de algoritmos disponibles en este nodo:
- Kinematic Arriving
- Kinematic Flee
- Kinematic Wandering
- Dynamic Seek
- Dynamic Flee
- Dynamic Arrive
- Align
- Velocity Matching
- Persue
- Evade
- Look Where You’re Going

Los algoritmos dinámicos -salvo Dynamic Wander- pueden ser acompañados de Align y LWYG al seleccionar cualquiera de estas dos opciones.

**Face (5 caracteres):**
Seleccionar el nodo *face* y dar click en `visibility = on` en la pestaña derecha del motor.

**Dynamic Wander (5 caracteres):**
Seleccionar el nodo *wanderer* y dar click en `visibility = on` en la pestaña derecha del motor.

**Los códigos de los algoritmos se encuentran en la carpeta scripts.**
