
Pod::Spec.new do |s|
  s.name         = "RNGdt"
  s.version      = "4.5.7"
  s.summary      = "Tencent Ad. 腾讯广点通DSK."
  s.description  = <<-DESC
  Tencent Ad. 腾讯广点通DSK.
                   DESC
  s.homepage     = "http://dev.e.qq.com/dev/#sdk"
  s.license      = "MIT"
  s.author       = { "Steven" => "ineva@qq.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/iineva/react-native-gdt.git", :tag => "master" }
  s.source_files  = "**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React"
  s.vendored_libraries = "GDT/libGDTMobSDK.a"
  s.ios.frameworks = 'AdSupport','CoreLocation','QuarzCore','SystemConfiguration','CoreTelephony','Security','StoreKit'
  s.ios.library = 'z'

end