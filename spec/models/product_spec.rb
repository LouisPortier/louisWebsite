require 'rails_helper'

describe Product do
	context "when the product has comments" do
		let(:product) { Product.create!(name: "race bike") }
		let(:user) {User.create!(email: "test@email.com", password: "123456")}
		
		before do
	  	product.comments.create!(rating: 1, user: user, body: "Awful bike!")
	  	product.comments.create!(rating: 3, user: user, body: "Ok bike!")
	  	product.comments.create!(rating: 5, user: user, body: "Great bike!")
		end

		it "returns the average rating of all comments" do
			expect(product.average_rating).to eq 3
		end

		it "can return the highest rating of all comments" do
			expect(product.highest_rating_comment.rating).to eq 5
		end

		it "can return the highest rating of all comments" do
			expect(product.lowest_rating_comment.rating).to eq 1
		end

	end

	context "when creating a product" do

		it "has everything" do
			expect(FactoryBot.build(:product)).to be_valid
		end

		it "is not valid without a name" do
			expect(Product.new(description: "Nice bike")).not_to be_valid
		end

	end
end