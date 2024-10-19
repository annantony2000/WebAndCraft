//
//  AppDelegate.swift
//  web and craft
//
//  Created by Ann Antony on 20/10/24.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Thread.sleep(forTimeInterval: 3.0)
        let windows = UIWindow(frame: UIScreen.main.bounds)
        let navigationVc = UINavigationController(rootViewController: HomeViewController())
        windows.rootViewController = navigationVc
        windows.makeKeyAndVisible()
        self.window = windows
        return true
    }
}
