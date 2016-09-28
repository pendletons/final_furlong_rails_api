require 'spec_helper'
require_relative '../../lib/api_constraints'

RSpec.describe ApiConstraints do
  describe 'matches?' do
    context 'when the version matches the Accept header' do
      it 'returns true' do
        request = double(host: 'api.finalfurlong.dev',
                         headers: { 'Accept' => 'application/vnd.finalfurlong.v1' })
        api_constraints_v1 = ApiConstraints.new(version: 1)
        result = api_constraints_v1.matches?(request)

        expect(result).to be true
      end
    end

    context 'when default option is specified' do
      it 'returns the default version' do
        request = double(host: 'api.marketplace.dev')
        api_constraints_v2 = ApiConstraints.new(version: 2, default: true)

        result = api_constraints_v2.matches?(request)

        expect(result).to be true
      end
    end
  end
end
