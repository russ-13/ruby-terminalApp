require 'artii'                                                     #Call Ruby Gems
require 'colorize'
require 'rainbow'
require 'tty-prompt'
$customersarr = []                                                  #Create customers array
def new_customer                                                    #Method for New Customer creation
                                                                    #Pull array from database file
        puts " "
        puts "Enter Customer Detals Below!"
             user_name = ""
             loop do 
                 puts "Please type the customers name"
                 user_name = gets.strip
                 if user_name.empty?
                     puts Rainbow("This field can't be blank").bg(:red)
                 elsif user_name =~ (/\d/)
                     puts Rainbow("This field can't have numbers").bg(:red)
                 elsif user_name =~ (/\W/)
                     puts Rainbow("This field can't use symbols").bg(:red)
                 else 
                     break
                 end
             end

            puts "Enter Customer Phone Number"
            user_phone = gets.strip
            
        puts "Enter Customer Date Of Birth in DD/MM/YYYY Format"
            user_dob = gets.strip
        puts "How many initial loyalty points would you like to assign?"
        puts " "
        puts Rainbow("     30m Booking = 10 Points").bg(:blue)
        puts Rainbow("     60m Booking = 20 Points").bg(:green)
        puts Rainbow("Over 60m Booking = 30 Points").bg(:pink)
        puts " "
            loyalty = gets.strip.to_i

    puts "Customer Created!"
                                                                    #Creating an array for the customers                                                                                  
        customer = {}                                               #Creating a hash for this customer                                 
        customer[:name] = user_name                                     
        customer[:phone] = user_phone     
        customer[:dob] = user_dob
        customer[:loyalty] = loyalty                               
        $customersarr.push(customer)                                #Pushing this hash into 'customerarr' array
        puts " "
        puts $customersarr
        puts " "

    end

def view_customer        #Method for viewing customer card
        puts "Enter Customer Phone Number to view thier information" 
                            
        Puts[:name][:phone]   #print from specific hash matching from phone number
end

    def edit_customer       #Method for Editing a Customer
        puts "Edit Customer Method"
end    

    def new_booking         #Method for Booking an existing Customer modifying the loyalty points variable up or down
        puts "Enter Customer phone number Method"
end    
                
def delete_customer     #Method for Deleting a Customer
        puts "Please Enter Customer to Delete (Mobile Numnber)"
        user_phone = gets.strip
        $customersarr.delete_if { |h| h[:phone] == user_phone }

    puts "Customer Deleted!"
    puts ""
    #Save ammended array to file

end


staff_pw = "1234"      #Set Staff Passoword

a = Artii::Base.new 
a.asciify('word')

puts " "               #Title Screen Text
puts Rainbow("Welcome to...").bg(:deeppink)
puts " "
puts a.asciify('The Day Spa').light_magenta
puts " "

prompt = TTY::Prompt.new

password = prompt.mask("Please Enter Staff Password?")

puts " "

while 
    if password == staff_pw
        puts Rainbow("Access Granted").bg(:green)
    else
        puts Rainbow("Incorrect Password").bg(:red)
        password = prompt.mask("Please Enter Staff Password?")
    end
end

puts " "

exit = false

while exit == false

choices = %w(Create\ Customer View\ Customer Edit\ Customer Book\ Customer Delete\ Customer Exit)
answer = prompt.enum_select("What are we doing today?", choices)

if answer == "Create Customer"
    new_customer
elsif answer == "View Customer"
    view_customer
elsif answer == "Edit Customer"
    edit_customer
elsif answer == "Book Customer"
    new_booking
elsif answer == "Delete Customer"
    delete_customer
elsif answer == "Exit"
    exit = true
        end
    end
