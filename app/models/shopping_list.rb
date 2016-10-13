class ShoppingList < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, allow_nil: false
end
