require 'rails_helper'

describe User do
	context "User don't have a password" do

		it "is not valid" do
			expect(User.new(email: "test@email.com")).not_to be_valid
		end

	end
end