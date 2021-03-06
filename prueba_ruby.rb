
def listado
  file = File.open('archivo.csv', 'r').readlines
  data = []
  file.each { |ele| data.push(ele.split(', ').map(&:chomp)) }
  return data
end

def promedios(nota)
  file = File.open("archivo.csv", "r")
  data = file.readlines
  file.close
  data.each do |values|
  line = values.split(", ")
  nombre = line[0]
  arr = line[1].to_f + line[2].to_f + line[3].to_f + line[4].to_f + line[5].to_f
  promedio = arr / 5.0
      if promedio < nota
        puts "Alumno #{nombre} reprobo con un promedio final #{promedio}"  
      else
        puts "Alumno #{nombre} aprobo con un promedio final #{promedio}"
      end
      if  promedio != arr
        lista = File.open('prom_alumnos.csv', 'a')
        lista.puts " Alumno #{nombre} y su promedio #{promedio}"
        file.close
      end
  end
end


def inasistencias
  data = listado
  data.each do |lista|
  nombre = lista[0]
  asistencia = lista.select { |alu_asis| alu_asis == 'A' }.count
    puts "Listado final de inasistencias de #{nombre} es de #{asistencia}"
  end
end


def aprobado(nota)
  file = File.open("archivo.csv", "r")
  data = file.readlines
  file.close
  data.each do |values|
  line = values.split(", ")
  nombre = line[0]
  arr = line[1].to_f + line[2].to_f + line[3].to_f + line[4].to_f + line[5].to_f
  promedio = arr / 5.0
    if promedio < nota
      puts "Alumno aprobado ====>  #{nombre} "
     end
  end
end

# Entrada al menu de alumnos
select = 0
while select != 4


puts "\n"
puts "\n"
puts ">>>Elija una opcion del Menu<<<"
puts "\n"

puts "\n"
puts '--------- Menu alumnos ---------'
puts "\n"

puts '( 1 ) Alumnos y su promedio' 
puts "\n"
puts '( 2 ) Cantidad total de inasistencias por alumno'
puts "\n"
puts '( 3 ) Alumnos que aprobaron'
puts "\n"
puts '( 4 ) Salir'
puts "\n"

select = gets.chomp.to_i
  case select

  when 1
          puts "\n"
          puts "Listado del promedio final de los alumnos: "
          puts "\n"
          promedios(5)
  when 2
          puts "\n"
          puts "Listado de inasistenacias de los alumnos: "
          puts "\n"
          inasistencias
  when 3
          puts "\n"
          puts "Listado de alumnos aprobados: "
          puts "\n"
          aprobado(5)
  when 4
          puts ' *******[[ Adios ]]******'
  else
          puts "\n"
          puts 'Por favor elija una opcion correcta del 1 al 4'
          puts "\n"
  end
end

