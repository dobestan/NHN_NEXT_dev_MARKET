class Item < ActiveRecord::Base
  belongs_to :user

  validates :deal, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :finish, presence: true
  validates :price, presence: true
end
