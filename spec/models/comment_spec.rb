require 'rails_helper'

describe Comment do

	before do
		@user = User.create!(:email => "caitie.steffen@gmail.com", :password => "12345678" )
	end

end