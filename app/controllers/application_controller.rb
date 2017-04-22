# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :authenticate

  def logged_in?
    !current_user.nil?
  end

  def current_user
    return @current_user if @current_user
    return unless auth_present?

    user = User.find(auth["user"])
    @current_user ||= user if user
  end

  def authenticate
    render json: { error: t("access_denied") }, status: :unauthorized unless logged_in?
  end

  private

  def auth_present?
    authorization = request.env.fetch("HTTP_AUTHORIZATION", "")
    return false if authorization.blank?

    authorization.scan(/Bearer/).flatten.first # request
  end

  def auth
    Auth.decode(token)
  end

  def token
    request.env["HTTP_AUTHORIZATION"].scan(/Bearer(.*)$/).flatten.last
  end
end
