a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]

def aumenta_uno(array)
  array.map { |x| x + 1 }
end

def cambia_float(array)
  array.map { |x| x.to_f }
end

def cambia_string(array)
  array.map { |x| x.to_s }
end

def rechaza_menor_cinco(array)
  array.reject { |x| x < 5 }
end

def selecciona_mayor_cinco(array)
  array.select { |x| x > 5 }
end

def suma_del_array(array)
  array.inject(0) { |sum, x| sum + x }
end

def agrupar_pares(array)
  array.group_by { |x| x.even? }
end

def agrupar_mayores_seis(array)
  array.group_by { |x| x > 6 }
end

print aumenta_uno(a)
puts ''
print cambia_float(a)
puts ''
print rechaza_menor_cinco(a)
puts ''
print selecciona_mayor_cinco(a)
puts ''
print suma_del_array(a)
puts ''
print agrupar_pares(a)
puts ''
print agrupar_mayores_seis
