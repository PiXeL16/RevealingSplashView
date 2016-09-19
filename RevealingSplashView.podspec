Pod::Spec.new do |s|

  s.name         = "RevealingSplashView"
  s.version      = "0.0.8"
  s.summary      = "A Splash view that animates and reveals its content, inspired by the Twitter splash."
  s.description  = <<-DESC
A Splash view that animates and reveals its content, inspired by the Twitter splash, written in Swift
    DESC

  s.homepage     = "https://github.com/PiXeL16/RevealingSplashView"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Chris Jimenez" => "cjimenez16@gmail.com" }
  s.social_media_url   = "http://twitter.com/chrisjimeneznat"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/PiXeL16/RevealingSplashView.git", :tag => s.version }
  s.source_files  = "RevealingSplashView/", "RevealingSplashView/**/*.{h,m,swift}"

end
