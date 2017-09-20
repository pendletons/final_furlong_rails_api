# frozen_string_literal: true

module Api
  module V1
    class HorsesController < Controller
      def show
        horse = Horse.find_by!(game_id: params[:id])
        authorize horse
        render json: horse
      end
    end
  end
end
