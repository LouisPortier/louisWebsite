require 'rails_helper'

describe Comment do
	before(:each) do
		@user = FactoryBot.build(:user)
		@product = Product.create(name: "This is a test", description: "test", colour: "test", price: 100)
	end

	context "when the comment has no rating" do
		it "is not valid" do
			expect(@product.comments.new(user: @user, body: "I hate it so much I don't want to rate it")).not_to be_valid
		end
	end

	context "when the comment has no body" do
		it "is not valid" do
			expect(@product.comments.new(user: @user, rating: 5)).not_to be_valid
		end
	end

	context "when the comment has everything" do
		it "it is valid" do
			expect(@product.comments.new(user: @user, body: "test", rating: 5)).to be_valid
		end
	end
end