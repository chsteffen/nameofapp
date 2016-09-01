class PaymentsController < ApplicationController

def create
	@product = Product.find(params[:product_id])
	@user = current_user

	token = params[:stripeToken]
	# Create the charge on Stripe's servers - this will charge the user's card
	begin
		charge = Stripe::Charge.create(
			:amount => (@product.price*100).to_i,
			:currency => "usd",
			:source => token, 
			:description => params[:stripeEmail],
			:receipt_email => @user.email
			)

		if charge.paid
			Order.create!(total: @product.price, product_id: @product.id, user_id: @user.id)
		end

			flash[:success] = "Payment processed successfully"
		rescue Stripe::CardError => e
			# The card has been declined
			body = e.json_body
			err = body[:error]
			flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
		end
		
		redirect_to product_path(@product)
	end

end
