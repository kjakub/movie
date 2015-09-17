include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :gallery do
  	film
    snapshot { fixture_file_upload Rails.root.to_s + '/spec/factories/sample.jpg', 'image/jpeg' }
  end

end
