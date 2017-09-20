# frozen_string_literal: true

require "rails_helper"

RSpec.describe StallionPolicy do
  subject { described_class.new(user, horse) }

  let(:horse) { build(:stallion) }

  context "as a visitor" do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }
  end

  context "as an owner" do
    let(:user) { create(:user, :admin) }
    let(:horse) { build(:stallion, owner_id: user.id) }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:create) }
  end

  context "as an admin" do
    let(:user) { create(:user, :admin) }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:create) }
  end
end
