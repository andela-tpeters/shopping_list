require 'rails_helper'

RSpec.describe ShoppingList, type: :model do
  describe '#belongs_to' do
    it { is_expected.to belong_to :user }
  end

  describe '#validation' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :budget }
    it { is_expected.to validate_numericality_of :budget }
  end

  describe '#has_many' do
    it { is_expected.to have_many :items }
  end

  describe '#budget' do
    it { is_expected.to respond_to :budget }
  end
end
