file = "carrera_2_camellos.txt"
lines = []
n = 0;
File.readlines(file).each do |line|
  lines << line;
end

cantidad_camellos = lines[0] #cantidad camellos 
puts "Cantidad de camellos: " + cantidad_camellos
tiempos_camellos = lines[2]
# puts tiempos_camellos
# puts "--------------------"

values = lines[1].split (";")
codigos_camellos = []
hash = {} #aqui estaran guardados los nombres y codigos de los camellos
values.each do |value|
	codigos_camellos = value.split(",")
	hash[codigos_camellos[0]] = codigos_camellos[1]
end
hash.delete("\n")

puts "Codigos: "+ hash.inspect

temp = tiempos_camellos.split(",")
temp.each do |t|
	puts t
end











