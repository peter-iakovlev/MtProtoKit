Pod::Spec.new do |s|

  s.name         = "MTProtoKit"
  s.version      = "0.0.1"
  s.summary      = "Universal MTProto framework for both iOS and OS X"
  s.homepage     = "https://github.com/PauloMigAlmeida/MtProtoKit"
  s.license      = "MIT"
  s.authors      = { "Peter Iakovlev" => '', "Paulo Miguel Almeida" => "paulo.ubuntu@gmail.com" }

  s.ios.deployment_target = "6.1"
  s.osx.deployment_target = "10.8"
  s.source       = { :git => "https://github.com/PauloMigAlmeida/MtProtoKit.git", :tag => s.version }

  s.source_files  = "*.{h,m}", "MTProtoKit/**/*.{h,m}", "thirdparty/AsyncSocket/*.{h,m}"
  s.public_header_files = "**/*.h"

  s.subspec 'AFNetworking' do |ss|
    ss.source_files = "thirdparty/AFNetworking/*.{h,m}"
    ss.requires_arc = false
  end
  
  s.subspec 'OpenSSL' do |ss|
    ss.source_files = "openssl/openssl/*.{h,m}"
    ss.header_dir = "openssl"
    ss.libraries = "crypto"
    
	ss.ios.preserve_paths = "openssl/iOS/libcrypto.a"
	ss.ios.vendored_libraries = "openssl/iOS/libcrypto.a"
	
	ss.osx.preserve_paths = "openssl/OSX/libcrypto.a"
	ss.osx.vendored_libraries = "openssl/OSX/libcrypto.a"
  end

  s.framework  = "Foundation"
  s.ios.prefix_header_file = 'MtProtoKitiOS/MtProtoKit-Prefix.pch'
  s.library   = "z"
  s.requires_arc = true
  s.dependency "SSignalKit", "~> 0.0.2"

end
