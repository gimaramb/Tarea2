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
    		buscar_minimo(tiempos_aux)
    		temp += 1
    		end

    end

    def buscar_minimo(tiempos = [])
    	
    	3.times do
    		puts "HOLA:"
    		puts tiempos.each_with_index.min
    	end
    end

  end
end