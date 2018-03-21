require 'rails_helper'

describe Order do
	context "Order has no product" do
		let(:user) {User.create!(email: "test@email.com", password: "123456")}
	
		it "is not valid" do
			expect(user.orders.new(user: user, total: 0)).not_to be_valid
		end

	end
end