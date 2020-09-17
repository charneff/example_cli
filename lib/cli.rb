class CLI
    def start
        puts ""
        puts "Hi, welcome to drink finder"
        puts ""
        input = prompt_input
        until drinks = API.fetch_drinks(input)
            input = prompt_input
        end 
        display_drinks(drinks)
    end 
    
    def prompt_input
        puts ""
        puts "Please enter an ingredient to see drinks that use it"
        puts ""
        input = gets.strip.downcase
    end 

    def display_drinks(drinks)
        drinks.each.with_index do | d, i |
            puts "#{i}. #{d.name}"
         end
    end 


end 