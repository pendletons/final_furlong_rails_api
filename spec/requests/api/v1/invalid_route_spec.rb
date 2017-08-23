# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /foo/bar" do
  let(:error) { I18n.t("invalid_url", path: "/api/foo/bar") }

  before { get "/api/foo/bar" }

  it_behaves_like "a bad request"
  it_behaves_like "a response with an error"
end
