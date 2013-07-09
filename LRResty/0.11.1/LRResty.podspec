Pod::Spec.new do |s|
  s.name         = 'LRResty'
  s.version      = '0.11.1'
  s.summary      = 'Resty is a simple to use HTTP library for Cocoa and iOS apps, aimed at consuming RESTful web services and APIs. Forked by jrmiddle to resolve dispatch issue.'
  s.homepage     = 'http://projects.lukeredpath.co.uk/resty/'
  s.authors      = { 'Luke Redpath' => 'luke@lukeredpath.co.uk', 'Justin Middleton' => 'jrmiddle@gmail.com' }
  s.source       = { :git => 'https://github.com/WhistleLabs/LRResty.git', :tag => '0.11.1' }
  s.license      = 'MIT'

  s.source_files = 'Classes/**/*.{h,m}'
  s.exclude_files = '**/*NSData+Base64*'

  s.dependency 'NSData+Base64', '~> 1.0'
end
