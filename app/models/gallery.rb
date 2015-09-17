class Gallery < ActiveRecord::Base
  belongs_to :film
  validates :film, presence: true
  has_attached_file :snapshot, styles: { thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :snapshot, content_type: /\Aimage\/.*\Z/
  validates_attachment :snapshot, presence: true, size: { in: 0..3.megabytes }

end
