class Drink
    @@all = []
    attr_accessor :name, :category, :instructions, :ingredients, :measures, :glass
    attr_reader :drink_id, :ingredient

    def initialize(name: nil, drink_id: nil, ingredient: nil)
        @measures = []
        @ingredients = []
        @name = name 
        @drink_id = drink_id
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