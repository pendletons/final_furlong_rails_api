# frozen_string_literal: true
module Api
  module V1
    # :reek:UncommunicativeVariableName
    class BaseController < ActionController::Base
      protect_from_forgery if: proc { |c| c.request.format == "application/json" }
      before_action :require_login
      helper_method :signed_in?, :current_user

      delegate :signed_in?, to: :current_user

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
