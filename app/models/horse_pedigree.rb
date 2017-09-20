# frozen_string_literal: true

class HorsePedigree < ApplicationRecord
  belongs_to :horse
  belongs_to :sire, class_name: "Horse"
  belongs_to :dam, class_name: "Horse"
end
