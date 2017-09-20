# frozen_string_literal: true

class HorseSerializer < ActiveModel::Serializer
  has_one :sire
  has_one :dam

  attribute :game_id, key: :id
  attribute :display_name, key: :name
  attributes :gender, :status_id

  def sire
    HorseParentSerializer.new(object.sire) if object.sire
  end

  def dam
    HorseParentSerializer.new(object.dam) if object.dam
  end
end
