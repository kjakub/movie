FactoryGirl.define do

  factory :user do
    email "test@test.com"
    password "12345678"
    password_confirmation "12345678" 

    factory :another_user do 
      email "another@test.com"
    end

  end

end
