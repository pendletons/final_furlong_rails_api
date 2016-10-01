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
        request.headers['Authorization'] = nil
        get :index

        expect(json_response[:errors]).to eq 'Not authenticated'
      end
    end

    context 'with an authentication token' do
      it 'sets the current user' do
        user = FactoryGirl.create :user
        request.headers['Authorization'] = user.auth_token

        get :index

        expect(assigns[:current_user]).to eq user
      end
    end
  end
end
