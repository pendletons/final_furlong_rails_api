# frozen_string_literal: true

module Api
  module V1
    class UsersController < Controller
      def show
        user = User.find_by!(stable_id: params[:id])
        authorize user
        render json: user
      end
    end
  end
end
