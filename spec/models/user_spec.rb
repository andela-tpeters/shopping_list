require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#has_secured_password' do
    it { is_expected.to have_secure_password }
  end
end
