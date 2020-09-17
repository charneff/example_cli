class CLI
    def start
        puts ""
        puts "Hi, welcome to drink finder"
        puts ""
        cyclic_search
        puts ""
        puts "Please enter a number for drink for which you would like to see details"
        puts "or type 'exit' to exit"
        puts "or type 'search' to look for a drinks with a new ingredient"
        num_input = gets.strip.downcase
        if num_input == 'list'
            display_drinks(drinks)
        elsif num_input == 'search'
            cyclic_search
        end 
    end 

    def cyclic_search
        @ingredient = prompt_input
        until API.fetch_drinks(@ingredient)
            @ingredient = prompt_input
        end 
        drinks = Drink.find_by_ingredient(@ingredient)
        display_drinks(drinks)
    end 
    
    def prompt_input
        puts ""
        puts "Please enter an ingredient to see drinks that use it"
        puts ""
        gets.strip.downcase
    end 

    def display_drinks(drinks)
        drinks.each.with_index(1) do | d, i |
            puts "#{i}. #{d.name}"
         end
    end 


end 