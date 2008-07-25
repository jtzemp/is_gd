Gem::Specification.new do |s|
  s.name = "is_gd"
  s.version = "0.1.0"
  s.date = "2008-07-24"
  s.summary = "Lightweight interface to the http://is.gd service."
  s.email = "jtzemp@gmail.com"
  s.homepage = "http://github.com/jtzemp/is_gd"
  s.description = "A tiny library for working with is.gd URL minifying service"
  s.has_rdoc = true
  s.authors = ["JT Zemp"]
  s.files = %w{is_gd.rb LICENSE README test/fixtures.yaml test/test_is_gd.rb}
  s.test_files = ["test/test_is_gd.rb"]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["Manifest.txt", "README", "LICENSE"]
  # s.add_dependency("open-uri", ["> 0.0.0"])
end