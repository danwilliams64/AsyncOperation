#
# Be sure to run `pod lib lint AsyncOperation2.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AsyncOperation"
  s.version          = "0.1.5"
  s.summary          = "A library that makes working with async operations easier. Inspired by code featured on NSScreenCast."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
  			A library that makes working with async operations easier.
			Simply have your Operation descend from AsyncOperation, and override `execute`.
                       DESC

  s.homepage         = "https://github.com/danwilliams64/AsyncOperation"
  s.license          = 'MIT'
  s.author           = { "Dan Williams" => "dan@danwilliams.co" }
  s.source           = { :git => "https://github.com/danwilliams64/AsyncOperation.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/danielwilliams'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'AsyncOperation/AsyncOperation.swift'

  s.frameworks = 'Foundation'
end
