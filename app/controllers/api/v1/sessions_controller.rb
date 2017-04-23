# frozen_string_literal: true

module Api
  module V1
    class SessionsController < Controller
      skip_before_action :authenticate, only: :create

      def create
        user = User.find_by(email: login_params[:email])
        return invalid_login_attempt unless user

        if user.authenticate(login_params[:password])
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

      def login_params
        params[:auth]
      end
    end
  end
end
