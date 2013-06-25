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
  s.preserve_paths = "WhistleProto/"
  s.dependency 'protobuf-ios5-objc'
  s.xcconfig = {'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/corona_fw/WhistleProto"',
		'HEADER_SEARCH_PATHS' => '"$(PODS_ROOT)/corona_fw/WhistleProto"'} 
  
  def s.post_install(target)
	  # Src/Dst paths
	  PROTO_SRC_DIR = File.join(config.project_pods_root, "corona_fw", "MQX 3.8", "whistle", "corona", "common", "wmp")

	  #unless File.exists?(PROTO_SRC_DIR)
	  #  puts "No #{PROTO_SRC_DIR} found, required by :protobufit. Is your kit up to date?"
	  #  exit
	  #end

	  PROTO_TARGET_DIR = File.join(config.project_pods_root, "corona_fw", "WhistleProto")

	  PROTO_FILES = ["WhistleMessage.proto", "DataMessage.proto"]
	  PROTO_SRC_PATHS = PROTO_FILES.map { |s| File.join(PROTO_SRC_DIR, s) }
	 
	  # Copy files
	  PROTO_SRC_PATHS.map { |f| FileUtils.cp(f, PROTO_TARGET_DIR) }
	   
	  # Generate
	  PROTO_TARGET_PATHS = PROTO_FILES.map { |t| File.join(PROTO_TARGET_DIR, t) }
	  PROTOC = "protoc --plugin=#{PROTOC_OBJC_PLUGIN} --proto_path='#{PROTO_TARGET_DIR}' --objc_out='#{PROTO_TARGET_DIR}'"
	  PROTO_CMDS = PROTO_TARGET_PATHS.map { |t| "#{PROTOC} #{t}"}
	  PROTO_CMDS.map { |c| system_or_exit c }
  end

end
