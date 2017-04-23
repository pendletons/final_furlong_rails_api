# frozen_string_literal: true

module Api
  module V1
    class UsersController < Controller
      def show
        user = User.find(params[:id])
        authorize user
        render json: user
      end
    end
  end
end
