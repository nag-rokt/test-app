source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'

target 'test-app' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for test-app

    pod 'mParticle-Apple-SDK', '8.32.0'
    pod 'mParticle-BranchMetrics', '8.5.2' #When updating from 8.1.1 or lower to 8.5.2, the branch links issue appear
    pod 'mParticle-Google-Analytics-Firebase-GA4', '~> 8.0'
    # Add the Firebase pod for Google Analytics
    pod 'FirebaseAnalytics'
	
# For Analytics without IDFA collection capability, use this pod instead
# pod FirebaseAnalytics/Core

# Add the pods for any other Firebase products you want to use in your app
# For example, to use Firebase Authentication and Cloud Firestore
   pod 'FirebaseAuth'
   pod 'FirebaseFirestore'
    

  target 'test-appTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'test-appUITests' do
    # Pods for testing
  end

end
