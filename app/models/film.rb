class Film < ActiveRecord::Base
  belongs_to :user
  has_many :galleries, :dependent => :destroy
  accepts_nested_attributes_for :galleries, allow_destroy: :true
  validates :title, :user, :galleries, presence: true
end
