module Api
  module V1
    class SessionsController < BaseController
      skip_before_action :require_login, only: :create

      def create
        resource = User.find_by(email: params[:user_login][:email])
        return invalid_login_attempt unless resource

        if resource.authenticate(params[:user_login][:password])
          auth_token = resource.generate_auth_token
          render json: { auth_token: auth_token }
        else
          invalid_login_attempt
        end
      end

      def destroy
        resource = current_user
        resource.invalidate_auth_token
        head :ok
      end

      private

      def invalid_login_attempt
        render json: { error: t(".invalid_login_attempt") },
               status: :unprocessable_entity
      end
    end
  end
end
