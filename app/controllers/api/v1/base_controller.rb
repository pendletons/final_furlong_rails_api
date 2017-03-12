module Api
  module V1
    class BaseController < ActionController::Base
      before_action :require_login
      helper_method :signed_in?, :current_user

      def signed_in?
        current_user.signed_in?
      end

      def require_login
        return true if authenticated_user
        render json: { error: t("access_denied") },
               status: :unauthorized
      end

      def current_user
        @current_user ||= authenticated_user
      end

      private

      def authenticated_user
        authenticate_with_http_token do |token|
          User.where(auth_token: token).where("auth_token_created_at >= ?", 1.month.ago).first
        end
      end
    end
  end
end
