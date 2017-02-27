platform :ios, '9.0'

target 'ProjectStarter' do
  use_frameworks!

  pod 'Alamofire',            '~> 4.0'
  pod 'Crashlytics',          '~> 3.0'
  pod 'Fabric',               '~> 1.0'
  pod 'RealmSwift',           '~> 2.0'
  pod 'RxCocoa',              '~> 3.0'
  pod 'RxDataSources',        '~> 1.0'
  pod 'RxSwift',              '~> 3.0'
  pod 'UnboxedAlamofire',     '~> 2.0'

  pod 'Reveal-iOS-SDK',       '~> 1.0', :configurations => ['Debug']

  target 'ProjectStarterTests' do
    inherit! :search_paths

    pod 'Quick',              '~> 1.0'
    pod 'Nimble',             '~> 6.0'

  end

  target 'ProjectStarterUITests' do
    inherit! :search_paths
  end

end
