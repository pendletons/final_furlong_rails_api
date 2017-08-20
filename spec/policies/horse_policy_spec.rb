# frozen_string_literal: true

require "rails_helper"

RSpec.describe HorsePolicy do
  subject { described_class.new(user, horse) }

  let(:horse) { build(:horse) }

  context "as a visitor" do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }
  end
end
