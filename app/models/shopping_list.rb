class ShoppingList < ApplicationRecord
  has_many :items
  belongs_to :user
  validates :title, presence: true, allow_nil: false
end
