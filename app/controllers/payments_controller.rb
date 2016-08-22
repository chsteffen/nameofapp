class PaymentsController < ApplicationController

def create
	def find
		@product = params[:product_id]
	end
	token = params[:stripeToken]
	# Create the charge on Stripe's servers - this will charge the user's card
	begin
		charge = Stripe::Charge.create(
			:amount => @product.price,
			:currency => "usd",
			:source => token, 
			:description => params[:stripeEmail]
			)
		rescue Stripe::CardError => e
			# The card has been declined
		end
	end
end
