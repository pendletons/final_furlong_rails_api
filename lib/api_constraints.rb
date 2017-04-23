# frozen_string_literal: true

class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(request)
    @default || request.headers["Accept"].include?("application/vnd.finalfurlong.v#{@version}")
  end
end
