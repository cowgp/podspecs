Pod::Spec.new do |s|
  s.name         = "MHPrettyDate"
  s.version      = "1.1.0_jrmiddle"
  s.summary      = "An iOS framework that provides a simple mechanism to get  \"Pretty Dates\" (\"Yesterday\", \"Today\", etc.) from NSDate objects.  Patched by Justin to handle date changes."
  s.homepage     = "https://github.com/bobjustbob/MHPrettyDate"
  s.license      = 'MIT'
  s.author       = { "Bobby Williams" => "bjackw@mac.com" }
  s.source       = { :git => "https://github.com/jrmiddle/MHPrettyDate.git", :tag => "v1.1.0_jrmiddle" }
  s.platform     = :ios, '5.0'
  s.source_files = 'MHPrettyDate/**/*.{h,m}'
  s.resources    = "#{s.name}/**/*.{lproj}"
  s.requires_arc = true
  s.framework  = 'Foundation'
end
