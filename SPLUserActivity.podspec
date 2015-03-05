Pod::Spec.new do |s|
  s.name         = "SPLUserActivity"
  s.version      = "0.1.1"
  s.summary      = "Easily adopt Handoff for different types of activities."
  s.homepage     = "https://github.com/splinesoft/SPLUserActivity"
  s.license      = { :type => 'MIT', :file => 'LICENSE'  }
  s.author       = { "Jonathan Hersh" => "jon@her.sh" }
  s.source       = { :git => "https://github.com/splinesoft/SPLUserActivity.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'SPLUserActivity/*.{h,m}'
  s.frameworks   = 'Foundation', 'UIKit', 'WebKit'
  s.social_media_url = 'https://twitter.com/jhersh'
  s.compiler_flags = '-fmodules'
end
