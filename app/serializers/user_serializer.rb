# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attribute :stable_id, key: :id
  attributes :username, :name
end
