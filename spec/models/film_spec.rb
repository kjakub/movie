require 'rails_helper'

RSpec.describe Film, type: :model do

  it 'has a valid film' do
    expect(build(:film)).to be_valid
  end

  it 'is invalid without an user' do
    expect(build(:film, user: nil)).to_not be_valid
  end

end
