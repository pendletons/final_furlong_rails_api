# frozen_string_literal: true
module Api
  module V1
    # :reek:UncommunicativeVariableName
    class BaseController < ApplicationController
      protect_from_forgery if: proc { |c| c.request.format == "application/json" }
    end
  end
end
