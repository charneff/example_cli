class Drink
    @@all = []
    attr_accessor :id, :name, :instructions, :glass, :category

    def initialize 
        @@all << self
    end 

    def self.all
        @@all 
    end 
    
end