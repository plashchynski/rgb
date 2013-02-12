Gem::Specification.new do |s|
  s.name = "rgb"
  s.version = "0.1.0"
  s.date = "2013-02-12"
  s.summary = "A library built to handle the easy conversion, comparison and manipulation of colors with CSS-style hex color notation."
  s.email = "plashchynski@gmail.com"
  s.homepage = "https://github.com/plashchynski/rgb"
  s.description = "A library built to handle the easy conversion, comparison and manipulation of colors with CSS-style hex color notation."
  s.has_rdoc = true
  s.authors = ["Dmitry Plashchynski"]
  s.files = [ "README.md",
              "lib/rgb.rb",
              "lib/rgb/color.rb"
            ]
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
