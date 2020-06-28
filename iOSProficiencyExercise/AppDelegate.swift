//
//  AppDelegate.swift
//  iOSProficiencyExercise
//
//  Created by Rishabh Mathur on 02/04/20.
//  Copyright © 2020 Rishabh Mathur. All rights reserved.
//

import UIKit
import Reachability

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  let reachability = try? Reachability()

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    NotificationCenter.default.addObserver(self,
                                           selector: #selector(reachabilityDidChange(_:)),
                                           name: .reachabilityChanged, object: reachability)
    do {
        try reachability?.startNotifier()
    } catch {
        print("could not start reachability notifier")
    }

    return true
  }

  @objc func reachabilityDidChange(_ notification: Notification?) {
    guard let reachability = notification?.object as? Reachability else {
      print("Invalid reachability object.")
      return
    }

      switch reachability.connection {
      case .wifi:
          print("Reachable via WiFi")
      case .cellular:
          print("Reachable via Cellular")
      case .none:
          print("Network not reachable")
      case .unavailable:
          print("Network unavailable")
      }
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication,
                   configurationForConnecting connectingSceneSession: UISceneSession,
                   options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running,
    // this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
}
