require_relative '../LoyaltyApp.rb'

describe "delete customer" do

    it "should delete a customer from the data store" do
        customers = [{name: "Russ", phone: 1000000}]
        
        new_arr = delete_customer(true, customers, 1000000)
        expect(new_arr.length).to be(0)
    end

end