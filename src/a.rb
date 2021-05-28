puts "Please enter the customers mobile number (no spaces!)"         #Ask for desired customer
mobilenumber = gets.strip                                       #Store birthdate to lookup
    $customersarr.each do |customer|                         #Iterate through array of customers
        if customer[:phone]  == mobilenumber                      #if entered birthday is equal to recorded one
            puts "#{customer[:name]} Has #{customer[:loyaly]} Loyalty Points!"   #Display Customer and phone number
            puts "Would"
        else puts Rainbow("No Birthdays Today!").bg(:red)     #If nobody, display this
        end  
    end          
        puts ""   