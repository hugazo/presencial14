alumnos = [
  { nombre: 'hugo', edad: 31, comuna: 'macul', genero: 'm' },
  { nombre: 'gladys', edad: 30, comuna: 'linares', genero: 'f' }
]

def main(data)
  puts dialogo_bienvenida
  opcion = 0
  while opcion != 10
    opcion = menu_principal
    motor_seleccion(opcion, data)
  end
  puts dialogo_salida
end

def menu_principal
  opcion = 0
  while opcion <= 0 || opcion > 10
    puts dialogo_menu
    opcion = gets.chomp.to_i
  end
  opcion
end

def motor_seleccion(opcion, data)
  case opcion
  when 1 then opcion_uno_ingresar_persona(data)
  when 2 then puts 'Opcion 2'
  when 3 then puts 'Opcion 3'
  when 4 then puts 'Opcion 4'
  when 5 then puts 'Opcion 5'
  when 6 then puts 'Opcion 6'
  when 7 then puts 'Opcion 7'
  when 8 then puts 'Opcion 8'
  when 9 then puts 'Opcion 9'
  end
end

def dialogo_menu
  'Ingrese una opcion:
1) Ingresar nueva persona
2) Editar los datos de una persona
3) Eliminar una persona
4) Mostrar cantidad de personas
5) Mostrar comunas de personas
6) Listar personas entre 20 y 25 años
7) Mostrar suma de edades
8) Mostrar promedio de edades
9) Listar personas por genero
10) Salir'
end

def dialogo_bienvenida
  '**************************************
** Programa de Gestion de Personas  **
**************************************'
end

def dialogo_salida
  'Gracias por usar este programa'
end

# Fin dialogos

def opcion_uno_ingresar_persona(data)
  nuevo_alumno = crear_persona(dialogo_persona)
  puts nuevo_alumno
  data.push(nuevo_alumno)
end

def opcion_dos_editar_persona(data)
  alumno_seleccionado = buscar_persona()
end

def buscar_persona(data)
  puts 'Ingrese el nombre de la persona'
  nombre = gets.chomp.downcase
  persona = -1
  array.each_with_index { |val, i| persona = i if nombre == val[:nombre] }

end

def dialogo_persona
  persona = []
  puts 'Ingrese nombre de la persona'
  persona[0] = gets.chomp.downcase
  puts 'Ingrese la edad de la persona'
  persona[1] = gets.chomp.to_i
  puts 'Ingrese la comuna de la persona'
  persona[2] = gets.chomp.downcase
  puts 'Ingrese genero de la persona'
  persona[3] = gets.chomp.downcase
  persona
end

def crear_persona(array)
  hash = {}
  hash[:nombre] = array[0]
  hash[:edad] = array[1]
  hash[:comuna] = array[2]
  hash[:genero] = array[3]
  hash
end

main(alumnos)
