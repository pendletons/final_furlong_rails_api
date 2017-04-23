# frozen_string_literal: true

require "spec_helper"
require_relative "../../lib/api_constraints"

RSpec.describe ApiConstraints do
  describe "matches?" do
    context "when the version matches the Accept header" do
      it "returns true" do
        # rubocop:disable RSpec/VerifiedDoubles
        request = double(host: "api.finalfurlong.dev",
                         headers: { "Accept" => "application/vnd.finalfurlong.v1" })
        # rubocop:enable RSpec/VerifiedDoubles
        api_constraints = described_class.new(version: 1)
        result = api_constraints.matches?(request)

        expect(result).to be true
      end
    end

    context "when default option is specified" do
      it "returns the default version" do
        request = double(host: "api.marketplace.dev") # rubocop:disable RSpec/VerifiedDoubles
        api_constraints = described_class.new(version: 2, default: true)

        result = api_constraints.matches?(request)

        expect(result).to be true
      end
    end
  end
end
