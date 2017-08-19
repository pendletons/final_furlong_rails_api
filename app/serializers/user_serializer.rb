# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :stable_id
end
