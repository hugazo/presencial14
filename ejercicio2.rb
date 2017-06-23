nombres = ["Violeta", "Andino", "Clemente", "Javiera", "Paula", "Pia", "Ray"]

def nombre_mayor_cinco(array)
  array.select { |x| x.length > 5 }
end

def nombres_minuscula(array)
  array.map { |x| x.downcase }
end

def nombres_comienza_con(key, array)
  array.select { |x| x[0] == key }
end

def contar_letras_nombres(array)
  array.map { |x| x.length }
end

def eliminar_vocales(array)
  array.map { |x| x.gsub(/[aeiou]/, '') }
end

puts nombre_mayor_cinco(nombres)
puts nombres_minuscula(nombres)
puts nombres_comienza_con('P', nombres)
print contar_letras_nombres(nombres)
puts eliminar_vocales(nombres)
