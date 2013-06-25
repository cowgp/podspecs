#
# Be sure to run `pod spec lint WLWhistleCore.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "WLWhistleCore"
  s.version      = "0.0.1"
  s.summary      = "Core APIs for interacting with Whistle devices."
  s.homepage     = "http://github.com/jrmiddle/WLWhistleCore"
  s.license      = 'Whistle Labs, Inc. Proprietery'
  s.author       = { "Justin Middleton" => "justin@whistle.com" }
  s.source       = { :git => "http://github.com/jrmiddle/WLWhistleCore.git", :tag => "0.0.1" }
  s.platform     = :ios, '6.1'

  # A list of file patterns which select the source files that should be
  # added to the Pods project. If the pattern is a directory then the
  # path will automatically have '*.{h,m,mm,c,cpp}' appended.
  #
  s.source_files = 'WLWhistleCore/**/*.{h,m}'

  # A list of file patterns which select the header files that should be
  # made available to the application. If the pattern is a directory then the
  # path will automatically have '*.h' appended.
  #
  # If you do not explicitly set the list of public header files,
  # all headers of source_files will be made public.
  #
  s.public_header_files = 'WLWhistleCore/**/*.h'

  # A list of paths to preserve after installing the Pod.
  # CocoaPods cleans by default any file that is not used.
  # Please don't include documentation, example, and test files.
  #
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # Specify a list of frameworks that the application needs to link
  # against for this Pod to work.
  #
  s.framework  = 'ExternalAccessory'

  # Specify a list of libraries that the application needs to link
  # against for this Pod to work.
  #
  # s.library   = 'iconv'
  # s.libraries = 'iconv', 'xml2'

  # If this Pod uses ARC, specify it like so.
  #
  s.requires_arc = true

  # If you need to specify any other build settings, add them to the
  # xcconfig hash.
  #
  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }

  # Finally, specify any Pods that this Pod depends on.
  #
  #s.dependency 'protobuf-objc-iOS5', :git => 'git@github.com/jrmiddle/protobuf-objc-iOS5.git', :branch => 'master', :tag => '1.0.0'
  #s.dependency 'corona_fw', :git  => 'git@github.com:jrmiddle/corona_fw.git', :branch => 'master'
end
