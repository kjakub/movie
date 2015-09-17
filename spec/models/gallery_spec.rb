require 'rails_helper'

RSpec.describe Gallery, type: :model do

  it 'has a valid gallery' do
    expect(build(:gallery)).to be_valid
  end

  it 'is invalid without an snapshot' do
    expect(build(:gallery, snapshot: nil)).to_not be_valid
  end

end
