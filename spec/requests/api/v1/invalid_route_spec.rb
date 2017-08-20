# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /foo/bar" do
  it "fails" do
    get "/api/foo/bar"

    expect(response.status).to eq 400
    expect(json_error).to eq I18n.t("invalid_url", path: "/api/foo/bar")
  end
end
