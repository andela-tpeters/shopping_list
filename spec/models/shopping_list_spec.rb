require 'rails_helper'

RSpec.describe ShoppingList, type: :model do
  describe '#belongs_to' do
    it { is_expected.to belong_to :user }
  end

  describe '#validation' do
    it { is_expected.to validate_presence_of :title }
  end

  describe '#has_many' do
    it { is_expected.to have_many :items }
  end
end
