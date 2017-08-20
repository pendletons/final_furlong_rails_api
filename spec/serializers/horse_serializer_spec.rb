# frozen_string_literal: true

require "rails_helper"

RSpec.describe HorseSerializer do
  let(:serializer) { described_class.new(horse).as_json }
  let(:horse) { build(:horse) }

  context "when horse is unnamed" do
    let(:horse) { build(:horse, name: nil) }

    it "renders correctly" do
      expect(serializer).to eq(id: horse.game_id,
                               name: horse.display_name,
                               gender: horse.gender,
                               status_id: horse.status_id,
                               sire: nil,
                               dam: nil)
    end
  end

  context "when horse has no pedigree" do
    it "renders correctly" do
      expect(serializer).to eq(id: horse.game_id,
                               name: horse.display_name,
                               gender: horse.gender,
                               status_id: horse.status_id,
                               sire: nil,
                               dam: nil)
    end
  end

  context "when horse has a pedigree" do
    let(:horse) { create(:horse, :with_pedigree) }

    it "renders correctly" do
      expect(serializer).to eq(id: horse.game_id,
                               name: horse.display_name,
                               gender: horse.gender,
                               status_id: horse.status_id,
                               sire: {
                                 id: horse.sire.game_id,
                                 name: horse.sire.name
                               },
                               dam: {
                                 id: horse.dam.game_id,
                                 name: horse.dam.name
                               })
    end
  end
end
