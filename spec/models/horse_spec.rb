# frozen_string_literal: true

require "rails_helper"

RSpec.describe Horse do
  describe "slugs" do
    context "when horse is unnamed, without a dam" do
      let(:horse) { build(:horse, name: nil, dob: Date.new(2000, 1, 1)) }
      let(:uuid) { "123456789" }

      before { allow(SecureRandom).to receive(:uuid).and_return uuid }

      it "sets a slug with a unique id and yob" do
        expect { horse.save }.to change { horse.slug }
          .from(nil).to("123456789-2000")
      end
    end
  end

  describe "#yob" do
    let(:horse) { build(:horse, dob: Date.new(2000, 1, 1)) }

    it "returns the year of birth" do
      expect(horse.yob).to eq 2000
    end
  end
end
