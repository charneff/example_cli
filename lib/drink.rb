class Drink
    @@all = []
    attr_accessor :name
    attr_reader :id, :ingredient

    def initialize(name: nil, id: nil, ingredient: nil)
        @name = name 
        @id = id
        @ingredient = ingredient
        @@all << self
    end 

    def self.all
        @@all 
    end 

    def self.find_by_ingredient(ingredient)
        Drink.all.select {|d| d.ingredient == ingredient }
    end 
    
end