Pod::Spec.new do |s|
    s.name = 'vipaar-MessageKit'
    s.version = '1.0.0'
    s.license = { :type => "MIT", :file => "LICENSE.md" }
 
    s.summary = 'An elegant messages UI library for iOS.'
    s.homepage = 'https://github.com/VIPAAR/MessageKit'
    s.author = {
         "Steven Deutsch" => "stevensdeutsch@yahoo.com"
    }
    s.module_name = "MessageKit"
    s.source = { :path => "" }
    s.source_files = 'Sources/**/*.swift'
 
    s.swift_version = '5.3'
 
    s.ios.deployment_target = '12.0'
    s.ios.resources = 'Sources/Assets.xcassets'
 
    s.dependency 'InputBarAccessoryView', '~> 5.4.0'
 
 end
