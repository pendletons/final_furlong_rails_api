# frozen_string_literal: true

module Api
  module V1
    class SessionsController < Controller
      skip_before_action :authenticate, only: :create
      skip_after_action :verify_authorized
      skip_after_action :verify_policy_scoped

      def create
        return invalid_login_attempt unless (user_id = find_and_authenticate_user)

        render json: { jwt: Auth.issue(user: user_id) }
      end

      private

      def find_and_authenticate_user
        user = User.find_by(email: auth_params[:email])
        return unless user && user.authenticate(auth_params[:password])

        user.id
      end

      def invalid_login_attempt
        render json: { error: t(".invalid_login_attempt") },
               status: :unprocessable_entity
      end

      def auth_params
        params[:auth]
      end
    end
  end
end
