# frozen_string_literal: true

module Api
  class Controller < ::ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from Pundit::NotAuthorizedError, with: :acess_denied

    def parameter_missing(exception)
      render(json: { error: exception.to_s }, status: :bad_request)
    end

    def record_invalid(exception)
      render(json: { errors: exception.record.errors }, status: :unprocessable_entity)
    end

    def not_found
      render(json: { error: t("not_found") }, status: :not_found)
    end

    def access_denied
      render(json: { error: t("not_authorized") }, status: :forbidden)
    end
  end
end
