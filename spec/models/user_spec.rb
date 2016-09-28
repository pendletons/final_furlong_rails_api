require 'rails_helper'

RSpec.describe User do
  describe '#create' do
    context 'with valid info' do
      it 'succeeds' do
        user = build(:user)

        expect(user.save).to be true
      end
    end

    context 'with invalid info' do
      it 'does not succeed' do
        user = build(:user)
        user.password_confirmation = 'barry'

        expect(user.save).to be false
      end
    end
  end
end
