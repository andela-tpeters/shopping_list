class Item < ApplicationRecord
  belongs_to :shopping_list

  validates :task, presence: true, allow_nil: false
end
