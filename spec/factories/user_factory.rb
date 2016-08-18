FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }
	factory :user do
		email 
		password "123456789" 
		password_confirmation "123456789"
		first_name "Caitie"
		last_name "Steffen"
		admin false
	end

	factory :admin, class: User do
		email
		password "password"
		password_confirmation "password"
		admin true
		first_name "Admin"
		last_name "User"
	end
end