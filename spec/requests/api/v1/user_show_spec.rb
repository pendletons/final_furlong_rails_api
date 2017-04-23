# frozen_string_literal: true

require "rails_helper"
require "shared_examples/api_contexts"

RSpec.describe "Showing User" do
  let(:path) { api_get_path(api_user_path(id)) }
  let(:authorized_path) { api_get_path(api_user_path(id), headers) }
  let(:headers) { { headers: { "HTTP_AUTHORIZATION" => "Bearer #{jwt}" } } }
  let(:user) { create(:user) }
  let(:id) { user.id }

  it_behaves_like "an authenticated request"

  context "when authenticated" do
    let(:jwt) { Auth.issue(user: user.id) }

    context "when id don't match a user" do
      let(:id) { 0 }

      it "fails" do
        authorized_path

        expect(response.status).to eq 404
        expect(json_error).to eq I18n.t("not_found")
      end
    end

    context "when id matches user" do
      let(:path) { api_get_path(api_user_path(id), headers) }

      it_behaves_like "a show request" do
        before { authorized_path }
      end

      it "succeeds" do
        authorized_path

        expect(response.status).to eq 200
      end
    end
  end
end
