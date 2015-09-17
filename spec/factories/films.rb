FactoryGirl.define do
  
  factory :film do
    title "MyString"
    user
    after(:build) do |film|
      film.galleries << build(:gallery, film: film)
    end
  end

end
