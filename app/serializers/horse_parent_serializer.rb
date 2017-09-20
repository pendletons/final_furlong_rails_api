# frozen_string_literal: true

class HorseParentSerializer < ActiveModel::Serializer
  attribute :game_id, key: :id
  attributes :name
end
