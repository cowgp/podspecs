#
# Be sure to run `pod spec lint WLWhistleCore.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#

Pod::Spec.new do |s|
  s.name         = "WLWhistleCore"
  s.version      = "0.0.2"
  s.summary      = "Core APIs for interacting with Whistle devices."
  s.homepage     = "http://github.com/WhistleLabs/WhistleCore"
  s.license      = 'Whistle Labs, Inc. Proprietery'
  s.author       = { "Justin Middleton" => "justin@whistle.com" }
  s.source       = { :git => "git@github.com:WhistleLabs/WhistleCore.git", :tag => "0.0.2" }
  s.platform     = :ios, '6.1'
  s.source_files = 'WLWhistleCore/**/*.{h,m}'
  s.public_header_files = 'WLWhistleCore/**/*.h'
  s.framework  = 'ExternalAccessory'
  s.requires_arc = true
  s.dependency 'corona_fw'
end
