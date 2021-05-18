require 'artii'
require 'colorize'
require 'rainbow'

a = Artii::Base.new 
a.asciify('word')

puts Rainbow("Welcome to").bg(:lawngreen)

puts a.asciify('The Day Spa').light_magenta
