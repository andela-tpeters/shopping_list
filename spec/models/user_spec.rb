require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#has_secured_password' do
    it { is_expected.to have_secure_password }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email}
    it { is_expected.to validate_presence_of :password}
    it { is_expected.to validate_uniqueness_of :email}
    it { is_expected.to validate_length_of :password}
    it { is_expected.to allow_value("john@doe.com").for :email}
  end
end
