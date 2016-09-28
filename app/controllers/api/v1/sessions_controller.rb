module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = find_user_by_email

        if user && user.valid_password?(params[:session][:password])
          authenticate_user(user)
          update_user_auth_token(user)
          render json: user, status: 200, location: [:api, user]
        else
          render json: { errors: { base: [I18n.t('devise.failure.invalid')] } }, status: 422
        end
      end

      def destroy
        user = User.find_by(auth_token: params[:id])
        update_user_auth_token(user)

        head 204
      end

      private

        def find_user_by_email
          user_email = params[:session][:email]
          user_email.present? && User.find_by(email: user_email)
        end

        def authenticate_user(user)
          sign_in user, store: false
        end

        def update_user_auth_token(user)
          user.generate_authentication_token
          user.save!
        end
    end
  end
end
