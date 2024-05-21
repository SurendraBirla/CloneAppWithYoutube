class Product < ApplicationRecord
  belongs_to :user
  has_many :buys
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
