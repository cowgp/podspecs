require "fileutils"

proto_src_rel_dir    = File.join("corona_fw", "MQX 3.8", "whistle", "corona", "common", "wmp")
proto_target_rel_dir = File.join("corona_fw", "WhistleProto")	
proto_files = ["WhistleMessage.proto", "DataMessage.proto"]

Pod::Spec.new do |s|
  s.name         = "corona_fw"
  s.version      = "1.0.1"
  s.summary      = "Whistle device communication code"
  s.homepage     = "https://github.com/WhistleLabs/corona_fw"
  s.license      = 'WhistleLabs Proprietary'
  s.author       = { "Whistle Firmware" => "fw@whistle.com" }
  s.source       = { :git => "git@github.com:WhistleLabs/corona_fw.git" }
  s.source_files = ['MQX 3.8/whistle/corona/{include,common/wmps}/wmps1.{c,h}', 'WhistleProto/*.{m,h,proto}'] 
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.8'
  s.preserve_paths = "MQX 3.8/whistle/corona/common/wmp/*.proto"
  s.dependency 'protobuf-objc-iOS5'
  
  s.pre_install do |pod, target_definition|
    # ooh so nasty
    proto_src_dir = File.join(target_definition.sandbox_dir, proto_src_rel_dir)
    proto_target_dir = File.join(target_definition.sandbox_dir, proto_target_rel_dir)
    FileUtils.mkdir_p(proto_target_dir)

    # Touch placeholders for the objc files
    touch_commands = proto_files.map {|f| "touch #{proto_target_dir}/#{f.sub(".proto", "")}.pb.h #{proto_target_dir}/#{f.sub(".proto", "")}.pb.m"}
    touch_commands.map { |c| system c }

    # Copy the .protos for reference.
    proto_files.map { |f| FileUtils.cp(File.join(proto_src_dir, f), proto_target_dir) }
  end

  s.post_install do |target_definition|
    protoc_objc_plugin = File.join(target_definition.sandbox_dir, "protobuf-objc-iOS5", "src", "compiler", "protoc-gen-objc")
    proto_src_dir = File.join(target_definition.sandbox_dir, proto_src_rel_dir)
    proto_target_dir = File.join(target_definition.sandbox_dir, proto_target_rel_dir)

    proto_target_paths = proto_files.map { |t| File.join(proto_target_dir, t) }
    protoc = "protoc --plugin=#{protoc_objc_plugin} --proto_path='#{proto_target_dir}' --objc_out='#{proto_target_dir}'"
    proto_cmds = proto_target_paths.map { |t| "#{protoc} #{t}"}
    proto_cmds.map { |c| system c }
  end
end
