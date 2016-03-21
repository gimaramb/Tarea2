require_relative 'Carrera/Camello'


#Se lee el archivo
file = "carrera_2_camellos.txt"
lines = []
n = 0;
File.readlines(file).each do |line|
  lines << line;
end

#Cantidad de Camellos
cantidad_camellos = lines[0] #cantidad camellos 


#Código y Nombre Camellos
camellos_aux = lines[1].to_s.delete(' ').to_s
values = camellos_aux.split (";")
codigos_camellos = []
camellos = {} #aqui estaran guardados los nombres y codigos de los camellos
values.each do |value|
	codigos_camellos = value.split(",")
	camellos[codigos_camellos[1]] = codigos_camellos[0]
end
camellos.delete(nil)

#Tiempos Camellos
temp0 = lines[2].to_s.delete(' ').to_s
temp = temp0.split(",")
tiempos_hash = Hash.new{|hsh,key| hsh[key] = [] }
aux = 0
cantidad = temp.count

verdad = false
total = 0
temp.each do |distancia|
	if verdad == false
		verdad = true
	else
		total += distancia.to_i
		verdad = false
	end
end


temp.each do |t|
	if aux + 1 > cantidad
		break
	else 
		tiempos_hash[temp[aux]].push temp[aux+1]
		aux += 2
	end
end


#Ahora creamos los camellos

#Por cada camello
tiempos_hash.each do |codigo, tiempos_array|
	nuevo_camel = Carrera::Camello.build(camellos[codigo], codigo, tiempos_array)
	#Ahora se envian los tiempos de cada caballo para procesar tiempos y vueltas
	#Return un arreglo con el tiempo de cada caballo en cada vuelta

	#El método de abajo arroja los tiempos de vuelta del camello en un arreglo
	puts nuevo_camel.get_tiempos(tiempos_array).inspect


end













