class API

    #makes calls to our API 

    def self.fetch_drinks
        url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=martini"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_drinks = hash["drinks"]
       
        array_of_drinks.each do |drink_hash|
            drink_instance = Drink.new
            drink_instance.id = drink_hash["idDrink"]
            drink_instance.name = drink_hash["strDrink"]
            drink_instance.instructions = drink_hash["strInstructions"]
            drink_instance.glass = drink_hash["strGlass"]
            drink_instance.category = drink_hash["strCategory"]

        end
    end 

end 