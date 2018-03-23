require 'rails_helper'

describe Comment do
	context "when the comment has no rating" do
		@user = FactoryBot.build(:user)
		#let(:user) {User.create!(email: "test@email.com", password: "123456")}
		let(:product) { Product.create!(name: "race bike") }

		it "is not valid" do
			expect(product.comments.new(user: @user, body: "I hate it so much I don't want to rate it")).not_to be_valid
		end
	end
end