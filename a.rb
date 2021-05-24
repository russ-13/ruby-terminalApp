user_name = ""
loop do 
    puts "Please type the customers name"
    user_name = gets.chomp
    if user_name.empty?
        puts "This field can't be blank"
    elsif user_name =~ (/\d/)
        puts "This field can't have numbers"
    elsif user_name =~ (/\W/)
        puts "This field can't use symbols"
    else 
        break
    end
end


