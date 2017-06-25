require 'io/console'

alumnos = [
  { nombre: 'hugo', edad: 22, comuna: 'macul', genero: 'm' },
  { nombre: 'gladys', edad: 25, comuna: 'linares', genero: 'f' },
  { nombre: 'gurri', edad: 30, comuna: 'linares', genero: 'f' },
  { nombre: 'eduardo', edad: 32, comuna: 'san miguel', genero: 'm' },
  { nombre: 'alma', edad: 33, comuna: 'santiago', genero: 'f' }
]

def main(data)
  clear
  puts dialogo_bienvenida
  opcion = 0
  while opcion != 10
    opcion = menu_principal
    motor_seleccion(opcion, data)
  end
  dialogo_salida
  clear
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
  when 2 then opcion_dos_editar_persona(data)
  when 3 then opcion_tres_eliminar_persona(data)
  when 4 then opcion_cuatro_contar_personas(data)
  when 5 then opcion_cinco_mostrar_comunas(data)
  when 6 then opcion_seis_personas_entre_edades(data)
  when 7 then opcion_siete_suma_de_todas_las_edades(data)
  when 8 then opcion_ocho_promedio_edades_grupo(data)
  when 9 then opcion_nueve_lista_por_genero(data)
  end
end

# Dialogos comunes en menu.

def dialogo_menu
  "Ingrese una opcion:\n1) Ingresar nueva persona
2) Editar los datos de una persona\n3) Eliminar una persona
4) Mostrar cantidad de personas\n5) Mostrar comunas de personas
6) Listar personas entre 20 y 25 años\n7) Mostrar suma de edades
8) Mostrar promedio de edades\n9) Listar personas por genero\n10) Salir"
end

def dialogo_bienvenida
  '**************************************
** Programa de Gestion de Personas  **
**************************************'
end

def dialogo_salida
  clear
  puts 'Gracias por usar este programa'
  presione_para_continuar
end

# Fin dialogos

# Metodos llamados por las opciones directamente

def opcion_uno_ingresar_persona(data)
  dialogo_accion('Ingresar')
  nuevo_alumno = crear_persona(dialogo_persona)
  data.push(nuevo_alumno)
  confirmacion_ingreso_persona(data)
end

def opcion_dos_editar_persona(data)
  dialogo_accion('Editar')
  index_alumno = buscar_persona(data)
  puts "Se editará a #{llenar_persona(data, index_alumno)}"
  puts 'Si no desea modificar, presione [enter]'
  persona_nueva = crear_persona(dialogo_persona)
  data[index_alumno].each do |key, _value|
    if persona_nueva[key] != '' && persona_nueva[key] != 0
      data[index_alumno][key] = persona_nueva[key]
    end
  end
  confirmacion_modificacion_persona(data, index_alumno)
end

def opcion_tres_eliminar_persona(data)
  dialogo_accion('Eliminar')
  index_alumno = buscar_persona(data)
  puts "Se eliminará a #{llenar_persona(data, index_alumno)}"
  confirmar_eliminacion_persona(data, index_alumno)
end

def opcion_cuatro_contar_personas(data)
  clear
  puts "Hay ingresadas #{data.length} personas"
  terminar_ejecucion_opcion
end

def opcion_cinco_mostrar_comunas(data)
  clear
  puts 'Listado de comunas ingresadas:'
  comunas = data.group_by { |x| x[:comuna] }
  comunas.each_key { |x| puts "- #{mayusculas(x)}" }
  terminar_ejecucion_opcion
end

def opcion_seis_personas_entre_edades(data)
  clear
  puts 'Personas entre 20 y 25 años'
  personas = data.select { |x| x[:edad] >= 20 && x[:edad] <= 25 }
  personas.each { |x| puts "- #{mayusculas(x[:nombre])}" }
  terminar_ejecucion_opcion
end

def opcion_siete_suma_de_todas_las_edades(data)
  clear
  puts 'Suma de todas las edades'
  puts "- #{suma_edades(data)}"
  terminar_ejecucion_opcion
end

def opcion_ocho_promedio_edades_grupo(data)
  clear
  puts 'Promedio de edades del grupo'
  promedio = (suma_edades(data).to_f / data.length).round(2)
  puts "- #{promedio} años"
  terminar_ejecucion_opcion
end

def opcion_nueve_lista_por_genero(data)
  clear
  puts 'Listado de personas por genero'
  personas = data.group_by { |x| x[:genero] }
  personas.each_pair do |key, value|
    puts "Genero: #{key}"
    value.each { |x| puts "- #{mayusculas(x[:nombre])}" }
  end
  terminar_ejecucion_opcion
end
# Metodos secundarios

def suma_edades(data)
  data.inject(0) { |sum, x| sum + x[:edad] }
end

def confirmar_eliminacion_persona(data, index)
  opcion = ''
  while opcion != 's' && opcion != 'n'
    puts "Confirmar eliminación #{rescatar_nombre_persona(data, index)} (S/N)"
    opcion = gets.chomp.downcase
    if opcion != 's' && opcion != 'n'
      clear
      puts 'Opcion ingresada no valida'
    end
  end
  ejecutar_opcion_eliminacion(opcion, data, index)
end

def ejecutar_opcion_eliminacion(opcion, data, index)
  clear
  if opcion == 's'
    eliminar_persona(data, index)
  else
    eliminado = rescatar_nombre_persona(data, index)
    puts "No se eliminó a #{eliminado}"
  end
  terminar_ejecucion_opcion
end

def eliminar_persona(data, index)
  eliminado = rescatar_nombre_persona(data, index)
  if data.delete_at(index) != nil
    puts "Eliminado #{eliminado} correctamente"
  else
    puts "No fue posible eliminar a #{eliminado}"
  end
end

def rescatar_nombre_persona(data, index)
  mayusculas(data[index][:nombre])
end

def dialogo_accion(accion)
  clear
  puts "#{accion} Persona"
end

def confirmacion_ingreso_persona(data)
  clear
  puts "Se creó nueva persona: con los siguientes detalles:
#{llenar_persona(data, data.length - 1)}"
  terminar_ejecucion_opcion
end

def confirmacion_modificacion_persona(data, index)
  clear
  puts 'La persona fue modificada, los nuevos datos son:'
  puts llenar_persona(data, index)
  presione_para_continuar
  clear
end

def llenar_persona(data, index)
  persona = data[index]
  texto = "Nombre: #{mayusculas(persona[:nombre])}\n"
  texto += "Edad:   #{persona[:edad]} años\n"
  texto += "Comuna: #{mayusculas(persona[:comuna])}\n"
  texto += "Genero: #{mayusculas(persona[:genero])}"
  texto
end

def buscar_persona(data)
  index_alumno = -1
  while index_alumno == -1
    index_alumno = index_buscar_persona(data)
    clear
    puts 'La persona ingresada no existe' if index_alumno == -1
  end
  index_alumno
end

def index_buscar_persona(data)
  persona = -1
  puts 'Ingrese el nombre de la persona'
  nombre = gets.chomp.downcase
  data.each_with_index { |val, i| persona = i if nombre == val[:nombre] }
  persona
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

def ingreso_nombre
  nombre = ''
  dialogo_ingreso('nombre')
  #todo terminar este metodo de ingreso, validando que tambien puedan hacerse ingresos sin texto para los updates :P
end

def dialogo_ingreso(dato)
  puts "Ingrese #{dato} de la persona"
end

def crear_persona(array)
  hash = {}
  hash[:nombre] = array[0]
  hash[:edad] = array[1]
  hash[:comuna] = array[2]
  hash[:genero] = array[3]
  hash
end

def terminar_ejecucion_opcion
  presione_para_continuar
  clear
end

def clear
  system 'clear'
end

def mayusculas(texto)
  texto.split.map(&:capitalize).join(' ')
end

def presione_para_continuar
  print '[Presione cualquier tecla para continuar]'
  STDIN.getch
end

main(alumnos)
