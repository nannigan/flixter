
FactoryGirl.define do
	factory :user do
	sequence :email do |n|
		"fuzzyCat#{n}@gmail.com"
	end
	password "purrnsnorezz"
	password_confirmation "purrnsnorezz"
	end
end