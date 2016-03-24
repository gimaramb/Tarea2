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
        vue = 0
    	vueltas.each do |v|
    		aux = 0
            
    		tiempos_aux = []
            if vue < 3
    		  puts 'Vuelta: ' + temp.to_s
              vue +=1
            end
            # h_camellos = Hash.new

            # camellos.each do |c|
            #     h_camellos[c.codigo] = v.resultados[camellos[aux].codigo]
            #     aux +=1
            # end
            

            # h_camellos = h_camellos.sort_by {|k,v| v}.reverse
            # puts h_camellos.inspect
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
                    num_test = 0
    				t.each do |test|
                        num_test = test
    					#puts tiempos_aux
    					if lugar == 1
                            num_aux=tiempos_aux[test]
    						camellos[test].puntaje << 6
                            camellos[test].puntaje_final += 6
                            puts "\n    Primer Lugar: "+camellos[test].nombre.to_s+"   ("+tiempos_aux[test].to_s+" seg)"
    						#puts camellos[test].codigo.to_s+": "+ camellos[test].puntaje.to_s+" - "+ camellos[test].puntaje_final.to_s
    						
    					elsif lugar == 2
    						camellos[test].puntaje << 4

                            camellos[test].puntaje_final += 4
                            puts "\n    Segundo Lugar: "+camellos[test].nombre.to_s+"   ("+tiempos_aux[test].to_s+" seg)"
    						#puts camellos[test].codigo.to_s+": "+ camellos[test].puntaje.to_s+" - "+ camellos[test].puntaje_final.to_s
    						
    					else
    						camellos[test].puntaje << 1
                            camellos[test].puntaje_final += 1
                            puts "\n    Tercer Lugar: "+camellos[test].nombre.to_s+"   ("+tiempos_aux[test].to_s+" seg)"
    						#puts camellos[test].codigo.to_s+": "+ camellos[test].puntaje.to_s+" - "+ camellos[test].puntaje_final.to_s
    						
    					end
    					
    					#puts t

    				#puts "------------"
    				end
                    tiempos_aux.delete_at(num_test)
    				lugar +=1
    				
    			end
    			
    		end
    		#buscar_minimo(tiempos_aux)
    		temp += 1
    		end
            puts "------ Puntos -------"

            h = Hash.new
            camellos.each do |c|
                h[c.nombre] = c.puntaje_final.to_i
            end

            h = h.sort_by {|k,v| v}.reverse
            #h = h.sort_by { |name, age| age }

            h.each do |key, value|
                puts key.to_s + ' : ' + value.to_s
            end

    end

    def buscar_minimo(camellos = [], tiempos = [])
    	
 		
 		
    	
    end

  end
end