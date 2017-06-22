# Actividad 014 - Hashes avanzados y enumerables

- Para poder realizar este actividad debes haber realizado los cursos previos junto con los videos online correspondientes a la experiencia 7.

- Crea una carpeta y guarda cada archivo .rb con el número de la pregunta, siguiendo las instrucciones de manera local con Sublime o Atom.

- Luego guarda los cambios y súbelos a tu repositorio de Github.

- Luego de pusheados los últimos cambios, sube el link de Github en el desafío de la sección correspondiente en la plataforma.


## Ejercicio 1: Ejercicios de bloques en Arrays

Dado el array:

~~~ruby
 a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]
~~~

1. Utilizando *map* generar un nuevo arreglo con cada valor aumentado en 1.
2. Utilizando *map* generar un nuevo arreglo que contenga todos los valores convertidos a *float*.
3. Utilizando *map* generar un nuevo arreglo que contenga todos los valores convertidos a *string*.
4. Utilizando *reject* descartar todos los elementos <u>menores</u> a 5 en el array.
5. Utilizando *select* descartar todos los elementos <u>mayores</u> a 5 en el array.
6. Utilizando *inject* obtener la suma de todos los elementos del array.
7. Utilizando *group_by* agrupar todos los números por paridad (si son pares, es un grupos, si son impares es otro grupo).
8. Utilizando *group_by* agrupar todos los números mayores y menores que 6.

## Ejercicio 2: Arrays y strings
Dado el arreglo 

~~~ruby
nombres = ["Violeta", "Andino", "Clemente", "Javiera", "Paula", "Pia", "Ray"]
~~~

Se pide:
 
1. Extraer todos los elementos que excedan mas de 5 caracteres utilizando el método *.select*.
- Utilizando *.map* crear una arreglo con los nombres en minúscula.
- Utilizando *.select* para crear un arreglo con todos los nombres que empiecen con P.
- Utilizando *.map* crear un arreglo único con la cantidad de letras que tiene cada nombre.
- Utilizando *.map* y *.gsub* eliminar las vocales de todos los nombres.

## Ejercicio 3: Array de hashes

1. Crear un menú que permita registrar la información de los alumnos del curso.

2. Opción 1: Permite ingresar los datos de una persona:
    - Nombre
    - Edad
    - Comuna
    - Género

3. Opción 2: Permite editar los datos de la persona.
4. Opción 3: Permite eliminar una persona.
5. Opción 4: Muestra la cantidad de personas ingresadas.
6. Opción 5: Muestra las comunas de todas las personas.

	*hint:* Generar un array con las comunas, eliminar repeticiones. Considerar que pueden haber nombres escritos con mayúscula y minúscula.

5. Opción 6: Muestra una lista con todas las personas que tengan entre 20 y 25 años.
6. Opción 7: Muestra la suma de las edades de todas las personas.
7. Opción 8: Muestra el promedio de las edades del grupo.
8. Opción 9: Muestra dos listas de personas, una por cada género.
9. El menú debe repetirse hasta que el usuario ingrese la opción 10 (salir).



