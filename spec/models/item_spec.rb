require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#belongs_to' do
    it { is_expected.to belong_to :shopping_list }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of :task }
  end
end
