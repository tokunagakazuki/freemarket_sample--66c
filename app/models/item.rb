class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User"

  scope :category, -> (number){where(category_id: number)}
  scope :recent, -> {order('id DESC').limit(4)}
  scope :brand,  -> (number){where(brand_id: number)}
end
