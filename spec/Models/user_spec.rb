require 'rails_helper'

describe User do

	before do
		@user = User.create!(email: "caitie.steffen@gmail.com", password: "Password278!")
	end
end