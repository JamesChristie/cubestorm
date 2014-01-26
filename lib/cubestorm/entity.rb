module Cubestorm

  class Entity

    include Position::Helpers

    attr_reader :name, :mesh, :position

    def initialize(name, mesh)
      @name = name
      @mesh = mesh
    end

  end

end
