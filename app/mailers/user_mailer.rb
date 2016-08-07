class UserMailer < ApplicationMailer
	default from: "caitie.steffen@gmail.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => 'caitie.steffen@gmail.com',
			:subject => "A new contact form message from #{name}")
	end
end
