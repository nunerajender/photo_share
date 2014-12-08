class Photo < ActiveRecord::Base

belongs_to :user 
	has_attached_file :image, :styles => {:full => "auto", :large => "600x600>", :medium => "400x400>", :thumb => "150x150>"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :image, presence: true
	validates :title, presence: true, length: {minimum: 3}
end
