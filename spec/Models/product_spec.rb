require 'rails_helper'

describe Product do 

	context "when the product has comments" do
		before do
	#here you put code to generate test content
			@product = Product.create!(name: "race bike")
			@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
			@product.comments.create!(rating: 3, user: @user, body: "It was okay.")
			@product.comments.create!(rating: 5, user: @user, body: "Best bike ever!")
				it "returns the average rating of all comments" do
					expect(@product.comments(average_rating)).should == 3
					expect(Product.new(description: "Nice bike")).not_to be_valid
				end
		end
	end
end

