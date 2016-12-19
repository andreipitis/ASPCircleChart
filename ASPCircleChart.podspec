#
# Be sure to run `pod lib lint ASPCircleChart.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ASPCircleChart'
  s.version          = '1.1.1'
  s.summary          = 'ASPCircleChart is a simple chart that uses slices on a circle to represent data.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ASPCircleChart is a simple chart that uses slices on a circle to represent data. The chart animates the addition and removal of slices, as well as the change of the existing slice values.
                       DESC

  s.homepage         = 'https://github.com/andreipitis/ASPCircleChart'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Andrei-Sergiu Pitis' => 'andrei.pitis@lateral-inc.com' }
  s.source           = { :git => 'https://github.com/andreipitis/ASPCircleChart.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AndyPitis'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ASPCircleChart/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ASPCircleChart' => ['ASPCircleChart/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
