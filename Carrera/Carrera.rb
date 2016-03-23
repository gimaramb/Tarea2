module Carrera
  class Carrera

    attr_accessor :vueltas, :camellos, :apuestas

    def self.build(camellos = [], vueltas = [])
      carrera = Carrera.new()
    end

    def initialize()
      @vueltas, @camellos = vueltas, camellos
    end

    def procesar_puntaje(camellos = [], vueltas = [])

    	temp = 1
    	cantidad_vueltas =0
    	vueltas.each do |v|
    		aux = 0
    		tiempos_aux = []
    		puts 'Vuelta: ' + temp.to_s

    		camellos.count.times do

    			#Tiempos aux es un arreglo donde estara almacenado el tiempo de cada camello, cada vuelta
    			tiempos_aux << v.resultados[camellos[aux].codigo]

    			#puts camellos[aux].codigo.to_s+": " + v.resultados[camellos[aux].codigo].to_s

    			
    			aux +=1

    			end
    		#puts tiempos_aux

    		if cantidad_vueltas < 3
    			cantidad_vueltas +=1
    			#Las vueltas que otorgan puntaje son las tres primeras
    			lugar = 1
    			3.times do 
    				
    				#Obtenemos el o los indices de los camellos(s) que tienen el minimo tiempo en cada vuelta
    				t = tiempos_aux.each.with_index.find_all{ |a,i| a == tiempos_aux.min && a !=nil }.map{ |a,b| b }
    				#puede ocurrir un empate
    				t.each do |test|
    					puts tiempos_aux
    					if lugar == 1
    						camellos[test].puntaje << 6
    						puts camellos[test].codigo.to_s+": "+ camellos[test].puntaje.to_s
    						
    					elsif lugar == 2
    						camellos[test].puntaje << 4
    						puts camellos[test].codigo.to_s+": "+ camellos[test].puntaje.to_s
    						
    					else
    						camellos[test].puntaje << 1
    						puts camellos[test].codigo.to_s+": "+ camellos[test].puntaje.to_s
    						
    					end
    					
    					
    					tiempos_aux.delete_at(test)
    					puts t

    				puts "------------"
    				end
    				lugar +=1
    				

    			end
    			
    		end
    		#buscar_minimo(tiempos_aux)
    		temp += 1
    		end

    end

    def buscar_minimo(camellos = [], tiempos = [])
    	
 		
 		
    	
    end

  end
end