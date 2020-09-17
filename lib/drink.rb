class Drink
    @@all = []
    attr_accessor :name
    attr_reader :id

    def initialize(name: nil, id: nil)
        @name = name 
        @id = id
        @@all << self
    end 

    def self.all
        @@all 
    end 
    
end