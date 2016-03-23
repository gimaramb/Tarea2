require_relative 'Carrera/Camello'
require_relative 'Carrera/Vuelta'

attr_accessor :camello, :vueltas

	def self.build (camello, vueltas = [])
		estadistico = Estadistico.new(camello, vueltas)
	end

   	def initialize(camello, vueltas)
   		@camello = camello
   		@vueltas = vueltas
    end

    def procesar_puntaje(vueltas)
    	
    end












