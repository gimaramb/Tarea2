module Carrera
  class Camello

    attr_accessor :nombre, :codigo, :puntaje, :puntaje_final
    largo_vuelta = 3210/5

    def self.build(nombre, codigo, tiempos = [])
      camello = Camello.new(nombre, codigo)  
    end


    def initialize(nombre, codigo)
      @nombre = nombre
      @codigo = codigo
      @puntaje = []
      @puntaje_final = 0
    end

    def get_tiempos(tiempos = [])
        procesar_tiempos(tiempos)
    end 

 
    def procesar_tiempos(tiempos_datos = [])
      #tiempos es un arreglo con los metros avanzados en cada segundo por el camello

      recorrido = 0
      tiempos = []
      tiempo_vuelta = 0
      vuelta = 1
      @largo_vuelta = 3210/5
      suma = 0
      #Procesamos los tiempos para calcular cuanto se demora por vuelta
      tiempos_datos.each do |distancia|
        suma += distancia.to_f
        recorrido += distancia.to_f
        if recorrido >= @largo_vuelta * 0.995
          #Si avanzo una vuelta, debemos calcular la velocidad del ultimo tramo 
          #Tenemos velocidad ultimo tramo, distancia a la meta -> tiempo que le tomo en el ultimo tramo
          velocidad = distancia.to_f
          tramo_restante = distancia.to_f - (recorrido.to_f - @largo_vuelta.to_f)
          #Ahora se calcula cuanto le tomo en el tramo final
          tiempo_restante = tramo_restante.to_i / velocidad.to_i
          tiempo_vuelta += tiempo_restante.to_i
          tiempos[vuelta - 1] = tiempo_vuelta
          #Ahora comienza la segunda vuelta adelante de la linea de meta (la diferencia). Tb reiniciamos variables
          vuelta +=1
          recorrido = recorrido.to_i - @largo_vuelta.to_i
          tiempo_vuelta = 1 - tiempo_restante.to_i
        else
          tiempo_vuelta += 1
        end      
      end
      #Se retornan los tiempos para cada vuelta
      puts @nombre + ": " + suma.to_s
      tiempos
    end





  end
end