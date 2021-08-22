//
//  AppDelegate.swift
//  TossUp
//
//  Created by Carter Burzlaff on 6/12/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit
import Firebase
import AppTrackingTransparency

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UserDefaults.standard.register(defaults:
            ["icon_size": 5,
             "premium": false,
             "av_landscape_only": true,
             "av_landscape_orientation": "Right",
             "av_player_autoplay": true
            ])
        
        FirebaseApp.configure()
        //GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [kGADSimulatorID, "a65e4656d438fabe31d9d562192c7d9798bb16bc"] as? [String]
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .badge, .sound],
            completionHandler: {approved, _ in
                if #available(iOS 14, *) { ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in }) }
            })
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: { settings in
            DispatchQueue.main.async {
                if settings.authorizationStatus == .authorized {
                    application.registerForRemoteNotifications()
                    
                    let content = UNMutableNotificationContent()
                    content.title = "Still on the CS:GO grind?"
                    content.body = "Consider learning more smokes to improve your game."
                    content.sound = UNNotificationSound.default
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 432000, repeats: false) // 5 days = 432000
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                        if let error = error { print(error) }
                    })
                }
            }
        })
        
        return true
    }
    
}

