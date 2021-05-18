require 'artii'
require 'colorize'
require 'rainbow'
require 'tty-prompt'

staff_pw = "1234"

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

choices = %w(Create_Customer Edit_Customer Book_Customer Delete_Customer)
answer = prompt.enum_select("Select an editor?", choices)





