class API

    #makes calls to our API 

    def self.fetch_drinks(ingredient)
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        if response != ""
            drinks = JSON.parse(response)["drinks"]
            drinks.each do |d|
                Drink.new(name: d["strDrink"], drink_id: d["idDrink"], ingredient: ingredient) if d["strDrink"]
            end
        else
            puts ""
            puts "I did not find any drinks with that ingredient. Please try again."
        end 
    end 

    def self.get_drink_details(drink)
        url = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{drink.drink_id}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        details = JSON.parse(response)
        drink.category = details["drinks"][0]["strCategory"]
        drink.glass = details["drinks"][0]["strGlass"]
        drink.instructions = details["drinks"][0]["instructions"]
        details["drinks"][0].keys.each do |i|
            binding.pry
        end 
    end 



end 