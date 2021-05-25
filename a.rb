
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
