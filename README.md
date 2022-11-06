# Building_mySQL_DataBase

![bb](https://github.com/AaronNebreda/Building_mySQL_DataBase/blob/main/img/Blockbuster.jpg)

## Objetivo

El objetivo principal de este proyecto es construir una base de datos a partir de varios archivos csv y comprobar su correcto funcionamiento. Para ello se se debe seguir los siguientes cuatro pasos: 

   1. Exploración y limpieza de datos.
   2. Construcción de la bases de datos.
   3. Cargar la información en la base de datos.
   4. Realizar 10 consultas sobre la base de datos.


## Resumen

Se parte de los datos contenidos en 7 archivos csv, los cuales guardan información relativa a un videoclub o un sistema de alquiler de películas. Hay un listado de películas e información sobre ellas, otro listado de actores, un inventariado de las películas y un listado de los alquileres que se han realizado.

1. En primer lugar, utilizando el módulo pandas de python se realizó una exploración de la información para conocer como estructurar la base de datos. Además, con esta exploración se comprobó si había algún tipo de errata en la información y se manejaron los datos con el fin de eliminar información no relevante.

2. Después se construyó la estructura de la base de datos mediante la interfaz gráfica MySQL Workbench.

3. Posteriormente, utilizando el módulo SQLAlchemy, se cargó la información en la base de datos a partir de los DataFrame que se habían preparado durante la exploración y limpieza de datos.

4. Finalmente, también con el módulo SQLAlchemy, se realizaron 10 consultas utilizando SQL, de las cuales se obtiene información relevante a este sistema de alquiler de películas.


Dentro de este repositorio se encuentra todo el código que se ha utilizado para desarrollar el proyecto: 

   - Dos archivos jupyter notebook 
   
        clean.ipynb, donde se encuentra el proceso de exploración y limpieza de la información, y la carga de datos
                 
        consultas.ipynb, con las 10 consultas realizadas.
                    
   - squema.sql, archivo de texto con las sentencias que construyen la base de datos.
    
   - diagrama_EER.png, imagen con el diagrama entidad-relación de la base de datos.
    
    
    
## 1. Exploración y limpieza de datos.
    
 
La información está contenida en 7 tablas:

   - actores, listado de actores y actrices.
   - films, listado de películas e información realtiva a ellas, sobre la propia películas (título, duración) y en relación al alquiler (precio, tiempo de alquiler..)
   - categories, género cinematográfico
   - languages, idiomas de las películas
   - oldHDD, relaciona actores con películas, y categoría de películas.
   - inventory, inventariado de las películas
   - rental, relación de los alquileres, conecta con el inventario.
 
Como regla general para todas las tablas se hizo una primera exploración en busca de duplicados y nulos, también de valores constantes. 
En todas ellas se encontró una o dos columnas (fecha de actualización y año de lanzamiento) con valor constante, se dicidió eliminar estas columnas en todas las tablas porque no añadían ninguna información diferencial.

Todas las tablas poseían un id para cada registro, y algunas incluían los id de otras tablas lo que ya indicaba como serían las relaciones entre tablas.

La tablas rental tiene como FOREIGN KEY la columna inventory_id ee tabla inventory lo cual las relaciona. Pero en la tabla rental hay valores de inventory_id que no están incluidos en la tabla inventory, por lo que estos valores no podrán ser añadidos a esta tabla, ya que no se puede alquilar algo que no esté en el inventario. Se decide eliminar estos registros porno inventar información, se asume que las tablas están incompletas.

Por otro lado la tabla oldHDD que relaciona actores con películas, y categoría de películas, no tiene los id  de peliculas y actores, si no los nombres y títulos. Se importan los id de cada una de sus tablas de origen respectivamente con un join. Y como la información de categoría hace referencia solo a la película no tiene sentido que esté en esta tabla y la paso a la tabla film.

Una vez hechos estos retoques se dejan las tablas preparadas tal y como se construirán en la base de datos.



## 2. Construcción de la bases de datos.

Mediante la interfaz gráfica MySQL Workbench, se diseña y construye la base datos. La estructura de la base de datos se describe en el siguiente diagrama entidad-relación.

![bb](https://github.com/AaronNebreda/Building_mySQL_DataBase/blob/main/src/diagrama_EER.png)



## 3. Cargar la información en la base de datos.

Utilizando el módulo SQLAlchemy, se cargó la información en la base de datos a partir de los DataFrame que se habían preparado durante la exploración y limpieza de datos.



## 4. Realizar 10 consultas sobre la base de datos.

También con el módulo SQLAlchemy, se realizaron las 10 siguientes consultas utilizando sentencias SQL, de las cuales se obtiene información relevante a este sistema de alquiler de películas:

1 - NÚMERO DE PELICULAS POR CATEGORÍA

2 - 5 PRIMEROS ACTORES CON MÁS PELÍCULAS

3 - PELIS DE ACCION O CIENCIA FICCION PARA TODOS LOS PUBLICOS QUE DUREN MENOS DE UNA HORA Y MEDIA

4 - LA MEDIA DE DURACIÓN DE LAS PELIS DE ANIMACIÓN Y NIÑOS

5 - LAS 15 PELIS MÁS ALQUILADAS

6 - PELI Y LISTA DE ACTORES QUE PARTICIPAN, DONDE HAYA MÁS DE 4 ACTORES

7 - NÚMERO DE EJEMPLARES DE CADA PELÍCULA EN CADA TIENDA Y CUANTAS ESTÁN ALQUILADAS

8 - CREAR UAN TABLA TEMPORAL CON LOS ALQUILERES Y UNA NUEVA COLUMNA QUE CALCULE EL TIEMPO DE ALQUILER

9 - ESTABLECER UNA PENALIZACIÓN SI EL ALQUILER REBASÓ LA DURACIÓN DE ALQUILER ESTABLECIDO POR PELÍCULA CON EL SIGUIENTE CÓDIGO 1 dentro del tiempo alquiler establecido 2 sobrepasa el tiempo de alquiler ESTOS CÓDIGOS SERÁN UN MULTIPLICADOR DEL PRECIO, ES DECIR, EL QUE SE PASE DEL TIEMPO PAGARÁ EL DOBLE (utilizaremos la tabla temporal creada en la consulta anterior)

10 - RECAUDACIÓN TOTAL

-->



