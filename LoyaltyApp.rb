require 'artii'
require 'colorize'
require 'rainbow'
require 'tty-prompt'

def new_customer        #Method for New Customer creation

    puts " "

    puts "Enter Customer Detals Below!"

    puts "Enter New Customers Name"
        user_name = gets.strip

    puts "Enter Customer Phone Number"
        user_phone = gets.strip.to_i

    puts "Enter Customer DOB in **/**/** Format"
        user_dob = gets.strip

    puts "How many initial loyalty points would you like to assign?"
        puts " "
        puts Rainbow("     30m Booking = 10 Points").bg(:blue)
        puts Rainbow("     60m Booking = 20 Points").bg(:green)
        puts Rainbow("Over 60m Booking = 30 Points").bg(:pink)

        loyalty = gets.strip.to_i

    puts "Customer Created!"

        customersarr = []                  #Creating an array for the customers                                                                                  
        customer = {}                      #Creating a hash for this customer                                 
        customer[:name] = user_name                                     
        customer[:phone] = user_phone     
        customer[:dob] = user_dob
        customer[:loyalty] = loyalty                               
        customersarr.push(customer)        #Pushing this hash into 'customerarr' array

        puts customersarr

    end

def view_customer        #Method for viewing customer card
        puts "Enter Customer Phone Number to view thier information" 

        Puts[:name][:phone]

    end
def edit_customer       #Method for Editing a Customer
        puts "Edit Customer Method"

    end    

def new_booking         #Method for Booking an existing Customer modifying the loyalty points variable up or down
        puts "Enter Customer phone number Method"
    end    
                
def delete_customer     #Method for Deleting a Customer
        puts "Delete Customer Method"

    end


staff_pw = "1234"      #Set Staff Passoword

a = Artii::Base.new 
a.asciify('word')

puts " "
puts " "


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
answer = prompt.enum_select("What are we doing today", choices)

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
