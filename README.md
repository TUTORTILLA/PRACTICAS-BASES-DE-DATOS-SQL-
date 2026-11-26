# Ejercicios U.T. 4 – El lenguaje SQL como DDL
**Lenguaje de Definición de Datos (DDL)**

## Tabla de contenido
* [Ejercicio 1](#ejercicio-1)
* [Ejercicio 2](#ejercicio-2)
* [Ejercicio 3](#ejercicio-3)
* [Ejercicio 4](#ejercicio-4)
* [Ejercicio 5](#ejercicio-5)

---

## Ejercicio 1

Disponemos de las siguientes tablas en nuestro modelo relacional. Se pide construir las tablas y restricciones correspondientes que den como resultado las tablas en **MySQL**.

**Restricciones y requisitos:**
* Hay que utilizar un tipo de dato lo más apropiado posible.
* Los campos de `domicilio` son los únicos que no son obligatorios.
* No es posible dar de alta existencias a precio `0` o inferior.
* El campo de la tabla `pub_empleado` solo puede tener los valores predeterminados: `"camarero"`, `"seguridad"` o `"limpieza"`.
* Se ha de mantener la integridad referencial entre las tablas.
* Las claves primarias vienen marcadas con el símbolo `#`.
* Los valores decimales de precio de artículos deben ser lo suficientemente grandes como para poner precios de más de `100€` a ciertas botellas.
* Las claves foráneas deben añadirse en sentencias `ALTER`.
* Crea un índice sobre la tabla `PUB` que ordene los PUBs por fecha de apertura descendente.

---

## Ejercicio 2

### 1. Tabla `perros`
Crea una tabla `perros` que almacene la siguiente información:
* **Nombre:** Cadena de hasta 25 caracteres, no puede ser nula.
* **DNI del dueño/a:** Cadena de 9 caracteres exactos.
* **Color de pelaje:** Cadena de hasta 25 caracteres.
* **Tipo de pelaje:** Solo podrá tener los valores `"corto"`, `"largo"` o `"lana"`.
* **Sexo:** Solo se podrá elegir entre `'M'` y `'F'`.
* **Adoptado:** Columna booleana para saber si ha sido adoptado o no.
* **Clave primaria:** Formada por las columnas de `dni` y `nombre` del perro.

### 2. Tabla `veterinarios`
Crea una tabla `veterinarios` que contenga la siguiente información:
* **Número de colegiado:** Código alfanumérico de 25 caracteres; será la clave primaria de la tabla.
* **Fecha de incorporación:** Tendrá por defecto la fecha de entrada en la BBDD.
* **Especialidad:** Valor entre las siguientes opciones: `"caninos"`, `"felinos"`, `"pequeños mamíferos"`, `"anfibios y reptiles"`, `"bovinos y ovinos"` o `"equinos"`.

### 3. Modificación de la tabla `perros`
Sobre la tabla `perros`, realiza una modificación de forma que añadas:
* Una columna `veterinario` que sea clave foránea referenciando a la tabla `veterinarios`.
* Una columna con la `raza` del perro.

### 4. Tabla `auxiliares`
Crea una tabla `auxiliares` que almacenará los datos de los auxiliares veterinarios del centro:
* **Hora de entrada:** Si no se especifica ninguna, usará el valor por defecto `09:00:00`.
* **Hora de salida:** Si no se especifica ninguna, usará el valor por defecto `17:00:00`.
* **Salario:** Número decimal con una restricción de integridad para que no sea menor al salario mínimo de la empresa (`1400` euros al mes).
* **Código de auxiliar:** Código alfanumérico de 15 caracteres que identificará unívocamente a cada auxiliar.

### 5. Tabla `al_cargo`
Crea una tabla `al_cargo` que almacene la información que relaciona los veterinarios con los posibles auxiliares a su cargo:
* `veterinario`: Identificará a un veterinario.
* `auxiliar`: Identificará a un auxiliar.
* **Clave primaria:** Ambas columnas formarán la clave primaria de la tabla `al_cargo`, de manera que cada veterinario tenga a su disposición tantos auxiliares como sea necesario y un auxiliar pueda trabajar con varios veterinarios.

### 6. Tabla `tratamiento`
Crea una tabla `tratamiento` que relacione un perro con el veterinario que le ha tratado, incluyendo además:
* **Precio:** No puede ser nulo ni menor que `0`.
* **Fecha de fin:** Recogerá la fecha de fin del tratamiento si se prolonga en el tiempo (por defecto se entiende que los tratamientos terminan el mismo día que empiezan).
* **Descripción:** Para explicar de forma sencilla lo que se ha realizado al animal y por qué.

### 7. Tabla `sala_de_consulta`
Crea una tabla `sala_de_consulta` que almacene:
* Un número entero que se actualice de forma automática cada vez que se crea una nueva sala.
* La **descripción** de la sala, para entender para qué se utiliza cada una.

### 8. Modificación de la tabla `tratamiento`
Sobre la tabla `tratamiento`, realiza las siguientes modificaciones:
* Añade una clave foránea para vincularlo con la tabla `sala_de_consulta`.
* Añade una columna de `descuento` cuyo valor por defecto sea `0`.

---

## Ejercicio 3

Se requiere una base de datos para gestionar habitaciones, clientes, reservas y servicios de un **hotel**.

1. **Tabla `clientes`** *(Almacena la información de los clientes del hotel)*
   * `id_cliente`: Número entero autoincremental, clave primaria.
   * `nombre`: Cadena de hasta 50 caracteres, obligatoria.
   * `apellidos`: Cadena de hasta 100 caracteres, obligatoria.
   * `dni`: Cadena de 9 caracteres, única y obligatoria.
   * `teléfono`: Cadena de 9 caracteres.
   * `email`: Cadena de hasta 100 caracteres, única.
   * `fecha_registro`: Fecha, por defecto la fecha actual.

2. **Tabla `habitaciones`** *(Contiene los datos de cada habitación del hotel)*
   * `número_habitación`: Número entero, clave primaria.
   * `tipo`: Cadena que puede ser `"individual"`, `"doble"`, `"suite"` o `"familiar"`.
   * `capacidad`: Número entero positivo (número máximo de personas).
   * `precio_noche`: Número decimal con dos decimales, mayor que `0`.
   * `disponible`: Booleano, por defecto verdadero.
   * `descripción`: Cadena de hasta 200 caracteres (opcional).

3. **Tabla `reservas`** *(Registra cada reserva realizada por un cliente)*
   * `id_reserva`: Número entero autoincremental, clave primaria.
   * `id_cliente`: Clave foránea referenciando a `clientes`.
   * `número_habitación`: Clave foránea referenciando a `habitaciones`.
   * `fecha_entrada`: Fecha, obligatoria.
   * `fecha_salida`: Fecha, obligatoria.
   * `estado`: Cadena que solo puede ser `"confirmada"`, `"cancelada"` o `"finalizada"`.
   * `total`: Número decimal con dos decimales.

4. **Tabla `servicios`** *(Lista los servicios adicionales que ofrece el hotel)*
   * `id_servicio`: Número entero autoincremental, clave primaria.
   * `nombre`: Cadena de hasta 50 caracteres, obligatoria.
   * `precio`: Número decimal con dos decimales, mayor o igual a `0`.
   * `descripción`: Cadena de hasta 150 caracteres.

5. **Tabla `reserva_servicios`** *(Relaciona las reservas con los servicios contratados)*
   * `id_reserva`: Clave foránea referenciando a `reservas`.
   * `id_servicio`: Clave foránea referenciando a `servicios`.
   * `cantidad`: Número entero positivo, por defecto `1`.
   * `subtotal`: Número decimal con dos decimales.

> **Índice adicional:** Crear un índice sobre `fecha_entrada` en la tabla `reservas` en orden ascendente.

---

## Ejercicio 4

Se quiere crear una base de datos para administrar socios, clases, entrenadores y pagos de un **gimnasio moderno**.

1. **Tabla `socios`** *(Almacena la información de los socios registrados en el gimnasio)*
   * `id_socio`: Número entero autoincremental, clave primaria.
   * `dni`: Cadena de 9 caracteres, única y obligatoria.
   * `nombre`: Cadena de hasta 50 caracteres, obligatoria.
   * `apellidos`: Cadena de hasta 100 caracteres, obligatoria.
   * `fecha_nacimiento`: Fecha, obligatoria.
   * `teléfono`: Cadena de 9 caracteres, única.
   * `email`: Cadena de hasta 100 caracteres, única.
   * `fecha_alta`: Fecha, por defecto la fecha actual.

2. **Tabla `entrenadores`** *(Contiene los datos de los entrenadores disponibles)*
   * `id_entrenador`: Número entero autoincremental, clave primaria.
   * `dni`: Cadena de 9 caracteres, única y obligatoria.
   * `nombre`: Cadena de hasta 50 caracteres, obligatoria.
   * `apellidos`: Cadena de hasta 100 caracteres, obligatoria.
   * `especialidad`: Cadena que puede ser `"cardio"`, `"fuerza"`, `"yoga"`, `"crossfit"` o `"pilates"`.
   * `salario_hora`: Número decimal con dos decimales, mayor o igual a `12`.
   * `fecha_contratación`: Fecha, por defecto la fecha actual.

3. **Tabla `clases`** *(Registra las clases grupales ofrecidas por el gimnasio)*
   * `id_clase`: Número entero autoincremental, clave primaria.
   * `nombre`: Cadena de hasta 50 caracteres, obligatoria.
   * `id_entrenador`: Clave foránea referenciando a `entrenadores`.
   * `día_semana`: Cadena que puede ser `"Lunes"`, `"Martes"`, …, `"Domingo"`.
   * `hora_inicio`: Hora, obligatoria, debe estar entre `06:00` y `22:00`.
   * `duración_minutos`: Número entero positivo, entre `30` y `120`.
   * `aforo_máximo`: Número entero positivo (capacidad de la sala).
   * `activa`: Booleano, por defecto verdadero.

4. **Tabla `inscripciones_clases`** *(Relaciona socios con clases grupales)*
   * `id_socio`: Clave foránea referenciando a `socios`.
   * `id_clase`: Clave foránea referenciando a `clases`.
   * `fecha_inscripción`: Fecha y hora, por defecto la fecha y hora actual.
   * `asistió`: Booleano (registro de asistencia, puede ser nulo).

5. **Tabla `pagos_membresía`** *(Controla los pagos mensuales de los socios)*
   * `id_pago`: Número entero autoincremental, clave primaria.
   * `id_socio`: Clave foránea referenciando a `socios`.
   * `fecha_pago`: Fecha, por defecto la fecha actual.
   * `monto`: Número decimal con dos decimales, mayor que `0`.
   * `método_pago`: Cadena que puede ser `"efectivo"`, `"tarjeta"` o `"transferencia"`.
   * `mes_cubierto`: Número entero positivo (`1` para Enero, `12` para Diciembre).
   * `pagado`: Booleano, por defecto verdadero.

> **Índice adicional:** Crear un índice sobre `fecha_pago` en la tabla `pagos_membresía` en orden descendente.

---

## Ejercicio 5

Se necesita una base de datos para gestionar productos, proveedores, pedidos y ventas en una **tienda de electrónica**.

1. **Tabla `productos`** *(Almacena la información de cada producto disponible)*
   * `id_producto`: Número entero autoincremental, clave primaria.
   * `nombre`: Cadena de hasta 100 caracteres, obligatoria.
   * `categoría`: Cadena que puede ser `"smartphone"`, `"portátil"`, `"tablet"`, `"accesorio"` o `"componente"`.
   * `marca`: Cadena de hasta 50 caracteres, obligatoria.
   * `precio_venta`: Número decimal con dos decimales, mayor que `0`.
   * `stock`: Número entero positivo, cantidad disponible en inventario.
   * `stock_mínimo`: Número entero positivo, nivel de reabastecimiento.
   * `activo`: Booleano, por defecto verdadero.

2. **Tabla `proveedores`** *(Contiene los datos de los proveedores de productos)*
   * `id_proveedor`: Número entero autoincremental, clave primaria.
   * `nombre`: Cadena de hasta 100 caracteres, obligatoria.
   * `cif`: Cadena de 9 caracteres, única y obligatoria.
   * `teléfono`: Cadena de 9 caracteres.
   * `email`: Cadena de hasta 100 caracteres, única.
   * `dirección`: Cadena de hasta 200 caracteres.
   * `fecha_alta`: Fecha, por defecto la fecha actual.

3. **Tabla `pedidos_proveedor`** *(Registra los pedidos realizados a proveedores para reabastecer inventario)*
   * `id_pedido`: Número entero autoincremental, clave primaria.
   * `id_proveedor`: Clave foránea referenciando a `proveedores`.
   * `fecha_pedido`: Fecha, por defecto la fecha actual.
   * `fecha_entrega_estimada`: Fecha, obligatoria.
   * `estado`: Cadena que puede ser `"pendiente"`, `"enviado"`, `"recibido"` o `"cancelado"`.
   * `total_pedido`: Número decimal con dos decimales, mayor que `0`.

4. **Tabla `detalle_pedido`** *(Desglosa los productos incluidos en cada pedido a proveedores)*
   * `id_pedido`: Clave foránea referenciando a `pedidos_proveedor`.
   * `id_producto`: Clave foránea referenciando a `productos`.
   * `cantidad`: Número entero positivo, mayor que `0`.
   * `precio_compra`: Número decimal con dos decimales, mayor que `0`.

5. **Tabla `ventas`** *(Registra las ventas realizadas a clientes finales)*
   * `id_venta`: Número entero autoincremental, clave primaria.
   * `fecha_venta`: Fecha y hora, por defecto la fecha y hora actual.
   * `id_producto`: Clave foránea referenciando a `productos`.
   * `cantidad`: Número entero positivo, mayor que `0`.
   * `precio_unitario`: Número decimal con dos decimales.
   * `total_venta`: Número decimal con dos decimales.
   * `método_pago`: Cadena que puede ser `"efectivo"`, `"tarjeta"` o `"online"`.

> **Restricciones e índices adicionales:**
> * Ningún producto puede tener un `stock` inferior a `0`.
> * Crear un índice sobre `fecha_venta` en la tabla `ventas` en orden descendente.
