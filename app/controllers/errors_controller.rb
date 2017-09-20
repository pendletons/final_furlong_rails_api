# frozen_string_literal: true

class ErrorsController < ApplicationController
  skip_before_action :authenticate

  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def show
    raise ActionController::RoutingError.new(params[:path]) # rubocop:disable Style/RaiseArgs
  end
end
