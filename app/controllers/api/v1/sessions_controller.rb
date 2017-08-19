# frozen_string_literal: true

module Api
  module V1
    class SessionsController < Controller
      skip_before_action :authenticate, only: :create
      skip_after_action :verify_authorized
      skip_after_action :verify_policy_scoped

      def create
        user = User.find_by(email: auth_params[:email])
        return invalid_login_attempt unless user

        if user.authenticate(auth_params[:password])
          jwt = Auth.issue(user: user.id)
          render json: { jwt: jwt }
        else
          invalid_login_attempt
        end
      end

      private

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
