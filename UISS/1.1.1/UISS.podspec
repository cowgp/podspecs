Pod::Spec.new do |s|
  s.name     = 'UISS'
  s.version  = '1.1.1'

  s.platform = :ios, '5.0'
  
  s.license  = 'MIT'
  s.summary  = 'UIKit Style Sheets.'
  s.homepage = 'https://github.com/btaylor/UISS'
  s.author   = { 'Robert Wijas' => 'https://robertwijas.com' }
  s.description = 'NOTE: This version Whistle-custom. UISS stands for UIKit Style Sheets. UISS is an iOS library that provides you with a convenient way to define the style of your application. UISS is built on top of UIKit UIAppearance proxies.'  

  s.source   = { :git => 'https://github.com/btaylor/UISS.git' }

  s.source_files = 'Project/UISS'
  s.resources = 'Project/UISSResources.bundle'
  s.prefix_header_file = 'Project/UISS/UISS-Prefix.pch'

  s.frameworks = 'Foundation', 'UIKit'

  s.requires_arc = true
end
