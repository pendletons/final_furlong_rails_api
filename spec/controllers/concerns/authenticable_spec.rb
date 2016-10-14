require 'rails_helper'

class Authentication; end

RSpec.describe Authentication, type: :controller do
  controller do
    include Authenticable

    def index
      authenticate_with_token
    end
  end

  describe '#authenticate_with_token' do
    context 'without an authentication token' do
      it 'renders a json error message' do
        allow(controller).to receive(:user_signed_in?).and_return false
        get :index

        expect(json_response[:errors]).to eq 'Not authenticated'
      end
    end

    context 'with an authentication token' do
      it 'sets the current user' do
        user = create :user
        api_authorization_header user.auth_token

        get :index

        expect(assigns[:current_user]).to eq user
      end
    end
  end

  describe '#user_signed_in?' do
    context 'when there is a user in session' do
      it 'returns true' do
        user = create :user
        allow(controller).to receive(:current_user).and_return(user)

        expect(controller.user_signed_in?).to be true
      end
    end

    context 'when there is no user in session' do
      it 'returns false' do
        allow(controller).to receive(:current_user).and_return(nil)

        expect(controller.user_signed_in?).to be false
      end
    end
  end
end
