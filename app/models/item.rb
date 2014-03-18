class Item < ActiveRecord::Base
  self.per_page = 10;

  attr_accessor :main_image
  has_attached_file :main_image, styles: { medium: "300x300", thumb: "100x100"}, default_url: "/assets/180.jpg"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\Z/


  belongs_to :user

  default_scope -> { order("created_at DESC") }

  validates :deal, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :finish, presence: true
  validates :price, presence: true
end
