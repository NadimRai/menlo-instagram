class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	
	validates :image, presence: true
	validates :user_id, presence: true

	has_attached_file :image, styles: { :medium => "640x" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
