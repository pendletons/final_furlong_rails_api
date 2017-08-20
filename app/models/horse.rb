# frozen_string_literal: true

class Horse < ApplicationRecord
  extend FriendlyId

  friendly_id :slugged_name, use: :slugged

  has_one :pedigree, class_name: "HorsePedigree"
  has_one :sire, through: :pedigree
  has_one :dam, through: :pedigree

  validates :name, length: { maximum: 18 },
                   uniqueness: { case_sensitive: false },
                   allow_nil: true
  validates :game_id, presence: true
  validates :gender, inclusion: { in: %w[C F G M S] }

  delegate :name, to: :sire, prefix: true, allow_nil: true
  delegate :name, to: :dam, prefix: true, allow_nil: true

  def display_name
    name || "Unnamed"
  end

  def yob
    dob.year
  end

  private

  def slugged_name
    return name if name.present?

    slug_parts = if dam
                   [dam_name, yob]
                 else
                   [SecureRandom.uuid[0, 10], yob]
                 end
    slug_parts.join("-")
  end
end
