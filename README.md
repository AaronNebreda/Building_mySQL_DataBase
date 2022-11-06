# Building_mySQL_DataBase

![bb](https://github.com/AaronNebreda/Building_mySQL_DataBase/blob/main/img/Blockbuster.jpg)

## Objetivo

El objetivo principal de este proyecto es construir una base de datos a partir de varios archivos csv y comprobar su correcto funcionamiento. Para ello se se debe seguir los siguientes cautro pasos: 

    1. Exploración y limpieza de datos.
    2. Cosntrucción de la bases de datos
    3. Cargar la información en la base de datos.
    4. Realizar 10 consultas sobre la base de datos.


## Resumen

Se parte de los datos contenidos en 7 archivos csv, los cuales guardan información relativa a un videoclub o un sistema de alquiler de películas. Hay un listado de películas e información sobre ellas, otra información accesoria sobre las películas contenida en otras tablas como el idioma y el género cinematográfico. También hay un listado de actores y su relación con las películas. Y por otro lado un iventariado de las películas y un listado de los alquileres que se han realizado.

En primer lugar, utilizando el módulo pandas de python se realizó una exploración de la información para conocer como estructurar la base de datos. Además, con esta exploración se comprobó si había algún tipo de errata en la información y se manejaron los datos con el fin de eliminar información no relevante.

Después se construyó la estructura de la base de datos mediante la interfaz gráfica MySQL Workbench.

Posteriormente, utilizando el módulo SQLAlchemy, se cargó la información en la base de datos a partir de los DataFrame que se habían preparado durante la exploración y limpieza de datos.

Finalmente, también con el módulo SQLAlchemy, se realizaron 10 consultas utilizando SQL, de las cuales se obtiene información relevante a este sistema de alquiler de películas.

Dentro de este repositorio se encuentra todo el código que se ha utilizado para desarrollar el proyecto: 
    - Dos archivos jupyter notebook 
                    clean.ipynb, donde se encuentra el proceso de exploración y limpieza de la información, y la carga de datos
                    consultas.ipynb, con las 10 consultas realizadas.
    - squema.sql, archivo de texto con las sentencias que construyen la base de datos.
    - diagrama_EER.png, imagen con el diagrama entidad-relación de la base de datos
    
 








