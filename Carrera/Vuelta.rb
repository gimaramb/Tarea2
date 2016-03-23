#Vuelta debe contener un hash con el codigo del caballo y sus tiempos de vueltas[resultados]
#Ademas, debe contener otro Hash con los puntajes asigados: {codigo_caballo -> puntaje}
module Carrera
  class Vuelta

    attr_accessor :num_vuelta, :resultados, :puntajes
    largo_vuelta = 3210/5

    def self.build(num_vuelta)
      @resultados = Hash.new{|hsh,key| hsh[key] = float }
      vuelta = Vuelta.new(num_vuelta)  
    end

    def initialize(num_vuelta)
      @num_vuelta = num_vuelta
    end

    def set_resultado(resultado = {})
      #Lo que se recibe es todos los camellos con sus tiempos de cada vuelta en forma de arreglo
      #Entonces, para cada camello se saca su tiempo asociado a @num_vuelta
      standings = Hash.new{|hsh,key| hsh[key] = float }
      resultado.each do |codigo, tiempos_array|
        standings[codigo] = tiempos_array[@num_vuelta.to_i - 1]
        #En standings[codigo] tenemos los valores del tiempo que le tomo a cada camello completar una vuelta.
        standings[codigo]
      end
      @resultados = standings
    end

  end
end