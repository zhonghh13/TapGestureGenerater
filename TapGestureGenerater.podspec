Pod::Spec.new do |s|
  s.name         = "TapGestureGenerater"
  s.version      = "0.1.0"
  s.summary      = "TapGestureGenerater is get tap and gesture event."
  s.homepage     = "https://github.com/ikemai/TapGestureGenerater"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "ikemai" => "ikeda_mai@cyberagent.co.jp" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ikemai/TapGestureGenerater.git", :tag => s.version.to_s }
  s.source_files  = "TapGestureGenerater/**/*.{h,swift}"
  s.requires_arc = true
  s.frameworks = "UIKit"
end