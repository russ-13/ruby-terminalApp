def delete_customer(is_test, customer_arr, user_phone)  
    if is_test
        customer_arr.delete_if { |h| h[:phone] == user_phone }
        return customer_arr
    else
        puts "Please Enter Customer to Delete (Mobile Numnber)"
        phone = gets.strip
             customer_arr.delete_if { |h| h[:phone] == phone }
        puts "Customer Deleted!"
        puts ""
    end    
end