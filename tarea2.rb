require_relative 'Carrera/Camello'
require_relative 'Carrera/Vuelta'
require_relative 'Carrera/Carrera'


#Se lee el archivo
file = ARGV[0]
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
cantidad_lineas = lines.count - 2
aux = 2
temp = []
#puts lines[2]
cantidad_lineas.to_i.times do
	linea = lines[aux].to_s.delete(' ').to_s
	linea = linea.to_s.delete('\n').to_s
	new_array = linea.split(",")
	temp.concat(new_array)
	aux += 1
end
temp.delete("\n")
temp.delete("\t")
temp.delete(" ")
temp.delete(nil)
temp.delete("")
#puts temp.inspect



#Ahora para cada Codigo de camello le asociamos todas las distancias recorrida en un segundo en el hash
tiempos_hash = Hash.new{|hsh,key| hsh[key] = [] }
aux = 0
cantidad = temp.count
temp.each do |t|
	if aux + 1 > cantidad
		break
	else 
		code = temp[aux].delete("\t")
		code = code.delete("\n")
		code = code.delete(" ")
		if camellos.has_key? code
			#puts code
			tiempos_hash[code].push temp[aux+1]
			aux += 2
		else
			aux += 1
		end
	end
end

#puts tiempos_hash.inspect

#Ahora creamos los camellos

vueltas_todas = Hash.new{|hsh,key| hsh[key] = [] }
camellos_totales = []
temp = 0
#Por cada camello
tiempos_hash.each do |codigo, tiempos_array|
	nuevo_camel = Carrera::Camello.build(camellos[codigo], codigo, tiempos_array)
	#Ahora se envian los tiempos de cada camello para procesar tiempos y vueltas
	#Return un arreglo con el tiempo de cada caballo en cada vuelta
	#arroja los tiempos de todas las vueltas de un camello en un arreglo
	vueltas_todas[codigo] = nuevo_camel.get_tiempos(tiempos_array)
	camellos_totales[temp] = nuevo_camel
	temp+=1
	#puts vueltas_todas[codigo].inspect
end


#Ahora seteamos las vueltas, pasamos toda la informacion para cada instancia, la instancia procesa los datos
aux = 0
vueltas = []
5.times do
	v = Carrera::Vuelta.build(aux + 1)
	vueltas[aux] = v
	#Esto me retorna standing (@resultado), que es un arreglo con los metros recorridos por vuelta por cada camello
	v.set_resultado(vueltas_todas)
	puts "------------------"
	aux+=1
end

#Creamos una nueva carrera
nueva_carrera = Carrera::Carrera.build(camellos_totales,vueltas)
nueva_carrera.procesar_puntaje(camellos_totales, vueltas)












