<h1>Gestor de Libros</h1>

> Este repositorio contiene el código fuente y la documentación para el Gestor de Libros, una plataforma especializada en la venta de vehículos de alta gama diseñados específicamente para ejecutivos.


## 🚀 Comandos de uso

Para la ejecución del proyecto se usa

```sh
dotnet run
```

Para generar el build se usa

```sh
dotnet build
```

## 📄 Estructura del proyecto

`root`: Carpeta principal de los archivos del proyecto que se encuentran en el directorio raíz del proyecto

![ROOT](/docs/root.png "Carpeta ROOT")

Dar a entender que se trabajo con EF CORE, con FIRST CODE, entonces cualquier cambio que se produzca de modelos, se debera generar la migracion necesaria a la base de datos, eso se puede lograr con el siguiente comando:

```sh
dotnet ef migrations add 'Nombre de la migración'
```

y para generar la actualización se usa:

```sh
dotnet ef database update
```

Esto generara la actualización en la base de datos de forma automatica


## 📝 Metodologia de uso

Tenemos 5 endpoints para los libros y 1 endpoint para el Login

![ENDPOINTS](/docs/endp.png "Endpoints")

Se trabajo con el sistema de JWT para los endpoints, entonces es necesario loguearse para que nos genere un JWT para los endpoints

Para poder ver los Endpoints puedes hacer click aca [JSON POSTMAN](/docs/Books-PruebaBACK.postman_collection.json)

Esta api esta conectada a una base de datos local, por lo que es necesario activarla de forma correspondiente al equipo de cada uno, tambien adjuntare el script que se uso para esta aplicacion

[SCRIPT BD](/docs/ScriptBooks.sql)

## 📝 Mejoras por hacer

- Validación de los datos a enviar
- Reconocer si existe o no el libro a borrar, editar o crear
- Generar vigencia de los libros y no borrarlos de base de dato



