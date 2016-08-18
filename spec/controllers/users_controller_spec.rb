require 'rails_helper'

describe UsersController, :type => :controller do 
	let(:user) { User.create!(email: "chsteffen@usfca.edu", password: "Password278!") }
	describe "GET #SHOW" do
			context "User is logged in" do
				before do
					sign_in :user
					it "loads correct user details" do
						get :show, id: @user.id
						expect(response).to have_http_status(200)
						expect(assigns(:user)).to eq user
					end
				end	
			end

			context "No user is logged in" do
				it "redirects to login" do
					get :show, id: @user.id
					expect(response).to redirect_to(root_path)
				end
			end
	end

	let(:user_two) { User.create!(email: "kt_2kool4skool@mac.com", password: "123456") }
	describe "GET #SHOW" do
		context "User_two is logged in" do
			before do
				sign_in :user_two
				it "loads correct user_two details" do
					get :show, id: @user_two.id
					expect(response).to have_http_status(200)
					expect(assigns(:user_two)).to eq user_two
				end
			end	
		end
		context "User not user_two is logged in" do
			it "cannot access user_two details" do
				get :show, id: @user_two.id
				expect(assigns(:first_user)).not_to eq user_two
				expect(response).to redirect_to(root_path)
			end
		end	
	end

end