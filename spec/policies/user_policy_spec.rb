# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserPolicy do
  subject { described_class.new(user, subject_user) }

  let(:subject_user) { build(:user) }

  context "as a visitor" do
    let(:user) { nil }

    it { is_expected.to permit_action(:show) }
  end
end
