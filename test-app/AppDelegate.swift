//
//  AppDelegate.swift
//  test-app
//
//  Created by Nahuel Local Account on 13/05/2025.
//

import UIKit
import mParticle_Apple_SDK
import FirebaseCore


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()

        //initialize mParticle
        let options = MParticleOptions(key: "KEY",
                                             secret: "SECRET")
        options.logLevel = MPILogLevel.verbose
        options.environment = MPEnvironment.development;
        
        options.onAttributionComplete = { attributionResult, error in
                    if let error = error as NSError? {
                        if let kitCode = error.userInfo[mParticleKitInstanceKey] {
                            NSLog("Attribution fetching for kitCode=\(kitCode) failed with error=\(error)")
                        } else {
                            NSLog("Attribution fetching failed with error=\(error)")
                        }
                        return
                    }

                    if let result = attributionResult {
                        NSLog("Attribution fetching for kitCode=\(result.kitCode) completed with linkInfo: \(result.linkInfo)")
                    }
                }

        MParticle.sharedInstance().start(with: options)
            
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

