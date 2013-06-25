Pod::Spec.new do |s|
  s.name         = "corona_fw"
  s.version      = "0.0.1"
  s.summary      = "Whistle device communication code"
  s.homepage     = "https://github.com/WhistleLabs/corona_fw"
  s.license      = 'WhistleLabs Proprietary'
  s.author       = { "Whistle Firmware" => "fw@whistle.com" }
  s.source       = { :git => "https://github.com/WhistleLabs/corona_fw.git" }
  s.source_files = 'MQX 3.8/whistle/corona/{include,common/wmps}/wmps1.{c,h}'
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.8'
  s.preserve_paths = "MQX 3.8/whistle/corona/common/wmp/*.proto"
end
