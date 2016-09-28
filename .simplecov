SimpleCov.start 'rails' do
  add_group 'Concepts', 'app/concepts'

  track_files "{app,lib}/**/*.rb"
end
