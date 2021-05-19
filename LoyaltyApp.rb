def new_customer        #Method for New Customer, create a hash inside an array, each customer is a hash
        puts "Enter Customer Details"
    end
                
def new_booking         #Method for Booking an existing Customer modifying the loyalty points variable up or down
        puts "Enter Customer phone number"
    end    
                
def customer_edit       #Method for Editing a Customer
        puts "Edit Customer Code"
    end
                
def delete_customer     #Method for Deleting a Customer
        puts "Delect Customer Code"
    end

require 'artii'
require 'colorize'
require 'rainbow'
require 'tty-prompt'

staff_pw = "1234"      #Set Staff Passoword

a = Artii::Base.new 
a.asciify('word')

puts Rainbow("Welcome to...").bg(:deeppink)

puts a.asciify('The Day Spa').light_magenta

prompt = TTY::Prompt.new

password = prompt.mask("Please Enter Staff Password?")

while 
    if password == staff_pw
        puts "Access granted"
    else
        puts "Incorrect Password"
        password = prompt.mask("Please Enter Staff Password?")
    end
end

exit = false

while exit == false


choices = %w(Create\ Customer Edit\ Customer Book\ Customer Delete\ Customer Exit)
answer = prompt.enum_select("What are we doing today", choices)

if answer == "Create Customer"
    new_customer
elsif answer == "Edit Customer (Not Available)"
    edit_customer
elsif answer == "Book Customer"
    book_customer
elsif answer == "Delete Customer (Not available)"
    delete_customer
elsif answer == "Exit"
    exit = true

    end
end