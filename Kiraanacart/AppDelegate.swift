//
//  AppDelegate.swift
//  Kiraanacart
//
//  Created by Sriramana on 06/04/20.
//  Copyright © 2020 NibagoHomeServieces. All rights reserved.
//

import UIKit
import CoreTelephony

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var network: NetworkManager = NetworkManager.sharedInstance
   let reachability = Reachability.init()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        
        // Setup the Network Info and create a CTCarrier object
              let networkInfo = CTTelephonyNetworkInfo()
              if #available(iOS 12.0, *) {
                  let carrier = networkInfo.serviceSubscriberCellularProviders?.first?.value
                  print(carrier?.carrierName)
              } else {
                  // Fallback on earlier versions
                  let carrier = networkInfo.subscriberCellularProvider
                  let carrierName = carrier?.carrierName
                  print(carrierName)
              }
              
            self.intilizeNetwork()
        
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

    
       func application(application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect) {
        let windows = UIApplication.shared.windows

        for window in windows {
            window.removeConstraints(window.constraints)
        }
    }

}

