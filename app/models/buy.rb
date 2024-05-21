class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :product
  # has_one_attached :image
  validates :user_id, presence: true
  validates :product_id, presence: true
end
