# frozen_string_literal: true

require "rails_helper"
require "shared_examples/api_contexts"

RSpec.describe "Invalid Route" do
  let(:path) { api_get_path("api/foo/bar") }

  it "fails" do
    path

    expect(response.status).to eq 400
    expect(json_error).to eq I18n.t("invalid_url", path: "/api/foo/bar")
  end
end
