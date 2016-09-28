require 'rails_helper'

RSpec.describe User do
  describe '#save' do
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

  describe '#generate_authentication_token' do
    context 'without a token set' do
      it 'generates a unique token' do
        allow(Devise).to receive(:friendly_token).and_return('auniquetoken123')
        user = create :user
        expect(user.auth_token).to eq 'auniquetoken123'
      end
    end

    context 'when user exists' do
      it 'generates a different token' do
        existing_user = create :user
        user = create :user

        expect(user.auth_token).not_to eq existing_user.auth_token
      end
    end
  end
end
