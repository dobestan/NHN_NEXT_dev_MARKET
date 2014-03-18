class Item < ActiveRecord::Base
  self.per_page = 10;

  belongs_to :user

  default_scope -> { order("created_at DESC") }

  validates :deal, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :finish, presence: true
  validates :price, presence: true
end