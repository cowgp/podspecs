require "fileutils"

proto_src_rel_dir    = File.join("corona_fw", "MQX 3.8", "whistle", "corona", "common", "wmp")
proto_target_rel_dir = File.join("corona_fw", "WhistleProto")	
proto_files = ["WhistleMessage.proto", "DataMessage.proto"]

Pod::Spec.new do |s|
  s.name         = "corona_fw"
  s.version      = "1.0.3"
  s.summary      = "Whistle device communication code"
  s.homepage     = "https://github.com/WhistleLabs/corona_fw"
  s.license      = 'WhistleLabs Proprietary'
  s.author       = { "Whistle Firmware" => "fw@whistle.com" }
  s.source       = { :git => "git@github.com:WhistleLabs/corona_fw.git" }
  s.source_files = ['MQX 3.8/whistle/corona/{include,common/wmps}/wmps1.{c,h}', 'WhistleProto/*.{m,h,proto}'] 
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.8'
  s.preserve_paths = "MQX 3.8/whistle/corona/common/wmp/*.proto"
  s.dependency 'protobuf-objc-iOS5', '1.0.1'
  
  s.prepare_command = <<-end

    SRC_DIR="#{File.join("MQX 3.8", "whistle", "corona", "common", "wmp")}"
    TARGET_DIR="WhistleProto"
    PROTO_FILES="WhistleMessage.proto DataMessage.proto"
    PROTO_OBJC_PLUGIN="/usr/local/bin/protoc-gen-objc"

    # Verify protoc exists and error hard if not
    if [ ! -f "${PROTO_OBJC_PLUGIN}" ]; then
        echo "ERROR: protoc compiler plugin \\\"${PROTO_OBJC_PLUGIN}\\\" not found!";
        echo "Did you install the protobuf-objc-ios brew formula?"
        exit 1;
    fi

    mkdir -p "${TARGET_DIR}"
    for proto_file in $PROTO_FILES; do
        cp "${SRC_DIR}/${proto_file}" "${TARGET_DIR}"
        protoc --plugin="${PROTO_OBJC_PLUGIN}" --proto_path="${TARGET_DIR}" --objc_out="${TARGET_DIR}" "${TARGET_DIR}/${proto_file}"
    done
    
  end

end
