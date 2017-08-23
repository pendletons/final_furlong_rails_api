# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /horses/:id" do
  let(:path) { api_horse_path(id) }
  let(:horse) { create(:horse) }
  let(:id) { horse.game_id }

  include_context "with a regular user"

  it_behaves_like "an authenticated request"

  context "when authenticated" do
    include_context "with a logged-in user"

    it_behaves_like "a not found request"
    it_behaves_like "a show request"
  end
end
