# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserSerializer do
  let(:serializer) { described_class.new(user) }
  let(:user) { create(:user) }

  it "renders correctly" do
    expect(serializer.as_json).to eq(id: user.id,
                                     name: user.name,
                                     stable_id: user.stable_id,
                                     username: user.username)
  end
end
