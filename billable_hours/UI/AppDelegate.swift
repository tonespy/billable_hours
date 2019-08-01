//
//  AppDelegate.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 29/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // SDKs initialization
        setupSdks(application, didFinishLaunchingWithOptions: launchOptions)
        
        // Views Handling
        handleViewLoad()
        return true
    }
    
    private func setupSdks(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        // Keyboard bla bla bla manager
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
    private func handleViewLoad() {
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        if let _ = UserDefaults().getUserInformation() {
            let homeController = HomeViewController()
            let nav = BaseNavigationController(rootViewController: homeController)
            window?.rootViewController = nav
        } else {
            let loginController = LoginViewController()
            window?.rootViewController = loginController
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

