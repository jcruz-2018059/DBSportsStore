# Base de Datos en MySQL para Tienda en Línea de Artículos Deportivos

Este repositorio contiene una base de datos diseñada en MySQL para una tienda en línea de artículos deportivos. La base de datos está estructurada para almacenar y gestionar información relacionada con los productos, clientes, pedidos y otras entidades relevantes para el funcionamiento de la tienda en línea.

## Modelo de Datos

El modelo de datos incluye las siguientes tablas principales:

- **Productos**: Almacena información sobre los productos disponibles en la tienda, como el nombre, descripción, precio, categoría, etc.
- **Clientes**: Registra los datos de los clientes de la tienda, como nombre, dirección, información de contacto, etc.
- **Pedidos**: Contiene información sobre los pedidos realizados por los clientes, como la fecha del pedido, estado del pedido, productos incluidos, precio total, etc.
- **Categorías**: Guarda las categorías de productos disponibles en la tienda, lo que permite una organización eficiente del inventario.

Además, se pueden incluir otras tablas auxiliares y relaciones según las necesidades específicas de la tienda en línea.

## Requisitos del Sistema

- MySQL Server instalado y configurado en tu entorno.
- Cliente de MySQL (p. ej., MySQL Workbench) o herramienta de línea de comandos para interactuar con la base de datos.

## Configuración de la Base de Datos

1. Crea una nueva base de datos en MySQL con el nombre deseado para la tienda en línea.
2. Ejecuta el script SQL proporcionado en este repositorio para crear las tablas y definir las relaciones entre ellas.
3. Si lo deseas, puedes importar los datos de muestra proporcionados en el repositorio o comenzar a insertar tus propios datos en las tablas correspondientes.

## Uso de la Base de Datos

Una vez configurada la base de datos, podrás utilizarla para almacenar y gestionar la información de tu tienda en línea de artículos deportivos. Algunas operaciones comunes incluyen:

- Insertar nuevos productos en la tabla "Productos".
- Registrar nuevos clientes en la tabla "Clientes".
- Realizar pedidos agregando registros en la tabla "Pedidos" y sus tablas relacionadas.
- Consultar la base de datos para obtener información sobre productos, clientes, pedidos, etc.

Adapta las consultas y operaciones según las necesidades específicas de tu tienda en línea.

