# frozen_string_literal: true

module Api
  class Controller < ::ApplicationController
    class AccessDeniedError < StandardError
      def initialize(message = t("not_authorized"))
        super(message)
      end
    end

    rescue_from ActionController::ParameterMissing do |exception|
      render(json: { error: exception.to_s }, status: :bad_request)
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      render(json: { errors: exception.record.errors }, status: :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotFound do
      render(json: { error: t("not_found") }, status: :not_found)
    end

    rescue_from AccessDeniedError do |exception|
      render(json: { error: exception.message }, status: :forbidden)
    end
  end
end
