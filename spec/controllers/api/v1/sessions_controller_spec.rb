require 'rails_helper'

RSpec.describe Api::V1::SessionsController do
  describe 'POST #create' do
    context 'when the credentials are correct' do
      it 'returns the user record' do
        attributes = attributes_for :user
        user = create :user, attributes
        credentials = { email: attributes[:email], password: attributes[:password] }
        post :create, params: { session: credentials }

        expect(response.status).to eq 200
        expect(json_response[:email]).to eq user.email
        expect(json_response[:auth_token]).to eq user.reload.auth_token
      end
    end

    context 'when the credentials are incorrect' do
      it 'returns a json with an error' do
        user = create :user
        credentials = { email: user.email, password: 'invalidpassword' }
        post :create, params: { session: credentials }

        expect(response.status).to eq 422
        expect(json_response[:errors]).to eq(base: ['Invalid email or password.'])
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'succeeds' do
      delete :destroy, params: { id: create(:user).auth_token }

      expect(response.status).to eq 204
    end
  end
end
