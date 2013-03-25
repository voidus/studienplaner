#encoding: utf-8
module Constraints
  class ModulSet
    include Jsonizable.new :modul_set
    include Equalizer.new :modul_set

    attr_accessor :modul_set

    def initialize modul_set
      @modul_set = modul_set
    end

    def satisfied_by? studienplan
      @modul_set.matches? studienplan.moduls
    end

    def unfulfilled_message
      "Der Plan enthält nicht alle Pflichtmodule"
    end

    def fulfilled_message
      "Der Plan enthält alle Pflichtmodule"
    end
  end
end
