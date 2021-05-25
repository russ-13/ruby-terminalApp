require 'artii'                                                     #Call Ruby Gems
require 'colorize'
require 'rainbow'
require 'tty-prompt'

$customersarr = []                                                  #Create customers array as global variable

def new_customer                                                    #Method for New Customer creation
    puts "\n"
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
    puts "Enter Customer Date Of Birth in DDMM Format"
        user_dob = gets.strip
    puts "How many initial loyalty points would you like to assign?"
        puts " "
        puts Rainbow("     30m Booking = 10 Points").bg(:blue)
        puts Rainbow("     60m Booking = 20 Points").bg(:green)
        puts Rainbow("Over 60m Booking = 30 Points").bg(:pink)
        puts " "
        loyalty = gets.strip.to_i
            puts "Customer Created!"
                                                                                 
        customer = {}                               #Creating a hash for this customer                                 
            customer[:name] = user_name                                     
            customer[:phone] = user_phone     
            customer[:dob] = user_dob
            customer[:loyalty] = loyalty                               
           $customersarr.push(customer)             #Pushing this hash into 'customerarr' array
        puts " "
        puts $customersarr                          #Print array for testing purposes
        puts " "
end

def view_customer                                   #Method for viewing customer card
        puts "Enter Customer Phone Number to view thier information"                  
            puts[:name][:phone]                     #print from specific hash matching from phone number
end

def view_birthdays                              #Method displaying customers who have a birthday today
    puts "What date would you like to check in DDMM format?"                #Ask for desired birthdate
        birthdate = gets.strip                  #Store birthdate to lookup
            $customersarr.each do |customer|
                if customer[:dob]  == birthdate
                    puts "#{customer[:name]} has a birthday! Contact them on #{customer[:phone]}"
                else puts "No Birthdays Today!"         
                end   
            end          
                puts ""          #Spacing
end    

def new_booking                 #Method for Booking an existing Customer modifying the loyalty points variable up or down
        puts "Enter Customer phone number Method"
end    
                
def delete_customer             #Method for Deleting a Customer
        puts "Please Enter Customer to Delete (Mobile Numnber)"
            user_phone = gets.strip
                $customersarr.delete_if { |h| h[:phone] == user_phone }
                    puts "Customer Deleted!"
                        puts ""
end

staff_pw = "1234"               #Set Staff Passoword

a = Artii::Base.new 
a.asciify('word')

puts " "                        #Title Screen Text
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

        choices = %w(Create\ Customer View\ Customer View\ Birthdays Book\ Customer Delete\ Customer Exit)
        answer = prompt.enum_select("What are we doing today?", choices)

    if answer == "Create Customer"
        new_customer
            elsif answer == "View Customer"
                view_customer
            elsif answer == "View Birthdays"
                view_birthdays
            elsif answer == "Book Customer"
                new_booking
            elsif answer == "Delete Customer"
                delete_customer
            elsif answer == "Exit"
                exit = true
    end
end
