# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  protect_from_forgery with: :exception, unless: -> { request.format.json? }

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
    authorization = request.headers["Authorization"]
    return false if authorization.blank?

    authorization.scan(/Bearer/).flatten.first
  end

  def auth
    Auth.decode(token)
  end

  def token
    request.headers["Authorization"].split(" ").last
  end
end
