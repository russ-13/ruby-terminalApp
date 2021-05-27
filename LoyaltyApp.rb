require 'artii'                                                     #Call Ruby Gems
require 'colorize'
require 'rainbow'
require 'tty-prompt'

$customersarr = []                                                  #Create customers array as global variable

#----------------------------Points Guide Method---------------------------#

def points_guide                                                    #Method for showing points scoreboard
    puts " "
    puts Rainbow("     30m Booking = 10 Points").bg(:blue)          #Colored point guide
    puts Rainbow("     60m Booking = 20 Points").bg(:green)
    puts Rainbow("Over 60m Booking = 30 Points").bg(:purple)
    puts " "
end

#--------------------------New Customer Method--------------------------------#

def new_customer                                                    #Method for New Customer creation
    puts "\n"
    puts "Enter Customer Detals Below!"
    user_name = ""                                                  #Set variable for user_name
    loop do                                                         #Start loop
        puts "Please type the customers name"
        user_name = gets.strip                                      #Make user input as user_name
        if user_name.empty?                                         #Handle error for no input
            puts Rainbow("This field can't be blank").bg(:red)          
        elsif user_name =~ (/\d/)                                   #Handle error for numbers in text field
            puts Rainbow("This field can't have numbers").bg(:red)
        else 
            break
        end
    end
        puts "Enter Customer Phone Number"
        user_phone = gets.strip
        puts "Enter Customer Date Of Birth in DDMM Format"
        user_dob = gets.strip
        puts "How many initial loyalty points would you like to assign?"
        points_guide
        loyalty = gets.strip.to_i
        puts "Customer Created!"
                                                                                 
    customer = {}                               #Creating a hash for this customer                                 
        customer[:name] = user_name             #Adding user input to populate hash                     
        customer[:phone] = user_phone     
        customer[:dob] = user_dob
        customer[:loyalty] = loyalty                               
        $customersarr.push(customer)            #Pushing this hash into 'customerarr' array
            puts "\n "
            puts $customersarr                  #Print array for testing purposes
            puts " \n"
end

#----------------------------------------View Customer Method--------------------------------------#

def view_customer                                                       #Method for viewing customer card
    puts "Which customer do you want to view? (Enter Moible Number)"    #Ask for desired mobile number
    mobilenumber = gets.strip                                           #Store mobile number to lookup
        $customersarr.each do |customer|                                #iterate through array of customers
            if customer[:phone]  == mobilenumber                        #for entered phone numnber
                puts "Name:#{customer[:name]} Phone:#{customer[:phone]} DOB:#{customer[:dob]} Points:#{customer[:loyalty]}"     #Print results
            else puts Rainbow("Customer Not Found!").bg(:red)           #Print this if customer not found
            end   
        end          
    puts ""                                                             #Spacing
end

#----------------------------------------View All Customers Method--------------------------#

def view_all
    puts "\n"
    puts "This is a list of all current customers:"
    puts "\n"
    $customersarr.each do |customer| 
        puts "Name: #{customer[:name]} Phone: #{customer[:phone]} DOB: #{customer[:dob]} Points: #{customer[:loyalty]}"
    end
end

#-----------------------------View Birthdays Method------------------------------------#

def view_birthdays                                                                          
    puts "What date would you like to check in DDMM format?"                                #Ask for desired birthdate
    birthdate = gets.strip                                                                  #Store birthdate to lookup
    $customersarr.each do |customer|                                                        #Iterate through array of customers
        if customer[:dob]  == birthdate                                                     #If entered birthday is equal to recorded one
            puts "#{customer[:name]} has a birthday! Contact them on #{customer[:phone]}"   #Display Customer and phone number
        else puts Rainbow("No Birthdays Today!").bg(:red)                                   #If nobody, display this
        end  
    end          
puts "\n"                                               
end    

#-----------------------------New Booking Method----------------------------------------#

def new_booking  
    puts "Please enter the customers mobile number (no spaces!)"                    #Ask for desired customer
    mobilenumber = gets.strip                                                       #Store birthdate to lookup
    $customersarr.each do |customer|                                                #Iterate through array of customers
        if customer[:phone]  == mobilenumber                                        #If entered birthday is equal to recorded one
            puts "#{customer[:name]} Has #{customer[:loyalty]} Loyalty Points!"     #Display Customer and phone number
            prompt = TTY::Prompt.new                                                #TTY Prompt Menu
            choices = %w(Add\ Points Redeem\ Points)
            answer = prompt.enum_select("What would you like to do now", choices, per_page: 2)
                if answer == "Add\ Points"
                    points_guide 
                    newpoints = gets.strip.to_i
                    customer[:loyalty] == customer[:loyalty] += newpoints           #Add points to loyalty key
                    puts "#{customer[:name]} Now has #{customer[:loyalty]} Loyalty Points!"
                elsif answer == "Redeem Points"
                    puts "How Many points would you like to redeem?"
                    points_guide
                    newpoints = gets.strip.to_i
                    customer[:loyalty] == customer[:loyalty] -= newpoints           #Subtract Points from user key
                    puts "#{customer[:name]} Now has #{customer[:loyalty]} Loyalty Points!"
                end
            else puts Rainbow("Customer not found!").bg(:pink)                      #If no record exists, display this
        end  
    end             
end   

#-------------------Customer Delete method--------------------------------------#
                
def delete_customer            
    puts "Please Enter Customer to Delete (Mobile Numnber)"
    user_phone = gets.strip
    $customersarr.delete_if { |h| h[:phone] == user_phone }
    puts "Customer Deleted!"
    puts "\n"
end

#----------------Title Screen--------------------------------------------------#

a = Artii::Base.new 
a.asciify('word')

puts " "                        #Title Screen Text
    puts Rainbow("Welcome to...").bg(:deeppink)
        puts " "
            puts a.asciify('The Day Spa').light_magenta
                puts " "

#-------------------Password---------------------------------------------------#

prompt = TTY::Prompt.new

password = prompt.mask("Please Enter Staff Password?")

puts "\n"

#Set Staff Passoword
staff_pw = "1234"               

while 
    if password == staff_pw
        puts Rainbow("Access Granted").bg(:green)
    else
        puts Rainbow("Incorrect Password").bg(:red)
        puts "\n"
        password = prompt.mask("Please Enter Staff Password?")
    end
end

puts " "

#------------------Main Menu---------------------------------------------------#

exit = false

while exit == false
    choices = %w(Create\ Customer View\ Customer View\ All\ Customers View\ Birthdays Book\ Customer Delete\ Customer Exit)
    answer = prompt.enum_select("What are we doing today?", choices, per_page: 7)
    if answer == "Create Customer"
        new_customer
    elsif answer == "View Customer"
        view_customer
    elsif answer == "View All Customers"
        view_all
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
