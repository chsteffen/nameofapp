if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		:publishable_key => 'pk_test_CSYEO2jqYeL3rbX2Qtfu1ICP',
		:secret_key => 'sk_test_o8lgt0muXwRnuJNKxIGM58L3 '
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]