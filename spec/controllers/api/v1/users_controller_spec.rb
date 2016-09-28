require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  describe 'GET #show' do
    it 'suceeeds' do
      user = create :user
      get :show, params: { id: user, format: :json }

      expect(response.status).to eq 200
    end

    it 'returns json hash' do
      user = create :user
      get :show, params: { id: user, format: :json }

      expect(json_response[:email]).to eql user.email
    end
  end

  describe 'POST #create' do
    context 'with valid info' do
      it 'creates the user and returns its json representation' do
        user_attributes = attributes_for :user

        post :create, params: { user: user_attributes, format: :json }

        expect(response.status).to eq 201
        expect(json_response[:email]).to eq user_attributes[:email]
      end
    end

    context 'with invalid info' do
      it 'returns errors for user' do
        user_attributes = attributes_for :user
        user_attributes.delete(:email)

        post :create, params: { user: user_attributes, format: :json }

        expect(response.status).to eq 422
        expect(json_response).to have_key(:errors)
        expect(json_response[:errors][:email]).to include "can't be blank"
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid info' do
      it 'updates the user and renders the json representation' do
        user = create :user
        patch :update, params: { id: user,
                                 user: { email: 'newmail@example.com' },
                                 format: :json }

        expect(response.status).to eq 200
        expect(json_response[:email]).to eq 'newmail@example.com'
      end
    end

    context 'with invalid info' do
      it 'renders an errors json' do
        user = create :user
        patch :update, params: { id: user,
                                 user: { email: 'bademail.com' },
                                 format: :json }

        expect(response.status).to eq 422
        expect(json_response).to have_key(:errors)
        expect(json_response[:errors][:email]).to include 'is invalid'
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the user' do
      user = create :user
      expect { delete :destroy, params: { id: user, format: :json } }
        .to change { User.count }.from(1).to(0)

      expect(response.status).to eq 204
    end
  end
end
