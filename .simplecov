SimpleCov.start "rails" do
  track_files "{app,lib}/**/*.rb"

  add_group "Policies", "app/policies"
end
SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter]

if ENV["ENABLE_CODECOV"]
  require "codecov"
  SimpleCov.formatter << SimpleCov::Formatter::Codecov
end
