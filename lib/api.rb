class API

    #makes calls to our API 

    def self.fetch_drinks(ingredient)
       
        url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        if response != ""
            drinks = JSON.parse(response)["drinks"]
            drinks.each do |d|
                Drink.new(name: d["strDrink"], id: d["idDrink"], ingredient: ingredient) if d["strDrink"]
            end
        else
            puts ""
            puts "I did not find any drinks with that ingredient. Please try again."
        end 
    
    end 



end 