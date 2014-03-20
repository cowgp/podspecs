Pod::Spec.new do |s|
  s.name            = "Analytics"
  s.version         = "0.10.4"
  s.summary         = "Segment.io analytics and marketing tools library for iOS."
  s.homepage        = "https://segment.io/libraries/ios"
  s.license         = { :type => "MIT", :file => "License.md" }
  s.author          = { "Segment.io" => "friends@segment.io" }
  s.source          = { :git => "git@github.com:segmentio/analytics-ios.git", :commit => "b7be9e1af2ac85b3f1a72276d1351a27369b2dbe"}
  s.source_files    = 'Analytics/*.{h,m}'
  s.platform        = :ios, "6.0"
  s.resources       = ["Analytics.framework/Versions/A/Resources/*"]
  s.frameworks      = "Analytics", "Foundation", "UIKit", "CoreData", "SystemConfiguration", 
                      "QuartzCore", "CFNetwork", "CoreTelephony", "Security", "CoreGraphics"
  s.libraries       = "sqlite3", "z"
  s.xcconfig        = { "OTHER_LDFLAGS" => "-ObjC", "FRAMEWORK_SEARCH_PATHS" => '"$(PODS_ROOT)/Analytics"' }
end
