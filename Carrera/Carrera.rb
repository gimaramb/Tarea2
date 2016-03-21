module Carrera
  class Carrera

    attr_accessor :vueltas, :camellos, :apuestas

    def self.build(camellos = [], vueltas = [], apuestas = [])
      video = Carrera.new()
      @vueltas, @camellos, @apuestas = vueltas, camellos, apuestas
    end

    def initialize()

    end

  end
end