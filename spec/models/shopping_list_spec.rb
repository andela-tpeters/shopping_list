require 'rails_helper'

RSpec.describe ShoppingList, type: :model do
  describe '#belongs_to' do
    it { is_expected.to belong_to :user }
  end
end
