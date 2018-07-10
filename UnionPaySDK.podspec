#
# Be sure to run `pod lib lint UnionPaySDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'UnionPaySDK'
    s.version          = '0.0.1'
    s.summary          = 'A short description of UnionPaySDK.'
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/7General'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'wanghuizhou' => 'wanghuizhou@guazi.com' }
    s.source           = { :git => 'https://github.com/7General/UnionPaySDK.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '8.0'
    
    s.vendored_libraries = 'UnionPaySDK/Frameworks/libPaymentControl.a'
    s.libraries = 'z'
    s.frameworks = 'CFNetwork','SystemConfiguration','CoreTelephony'

  s.source_files = 'UnionPaySDK/Classes/**/*'
  s.user_target_xcconfig =   {'OTHER_LDFLAGS' => ['-lc++']}

end
