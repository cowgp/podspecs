#
# Be sure to run `pod spec lint WLWhistleCore.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#

Pod::Spec.new do |s|
  s.name         = "WLWhistleCore"
  s.version      = "1.0.0"
  s.summary      = "Core APIs for interacting with Whistle devices."
  s.homepage     = "http://github.com/WhistleLabs/WhistleCore"
  s.license      = 'Whistle Labs, Inc. Proprietary'
  s.author       = { "Justin Middleton" => "justin@whistle.com" }
  s.source       = { :git => "git@github.com:WhistleLabs/WhistleCore.git", :tag => "1.0.0e" }
  s.platform     = :ios, '6.1'
  s.source_files = 'WLWhistleCore/**/*.{h,m}'
  s.public_header_files = 'WLWhistleCore/**/*.h'
  s.frameworks   = 'ExternalAccessory', 'CoreBluetooth'
  s.requires_arc = true
  s.dependency 'corona_fw', '1.0.1'
end
