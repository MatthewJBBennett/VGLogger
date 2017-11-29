//
//  AppDelegate.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/2/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import Hex

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // This area is to customize the look of the tab bar at the bottom of the app
        ////////////
        let tbController = self.window!.rootViewController as! UITabBarController
        tbController.tabBar.barTintColor = UIColor(hex: "#0A6ACD")//"#65799B") // blue
        tbController.tabBar.tintColor = UIColor(hex: "#1FE600")//"#86B86B") // green
        tbController.tabBar.unselectedItemTintColor = UIColor(hex: "#ffffff") // white
        ////////
        UINavigationBar.appearance().barStyle = UIBarStyle.default
        UINavigationBar.appearance().barTintColor = UIColor(hex: "0A6ACD")//"#65799B") // blue
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        //let defaults = UserDefaults.standard
        //defaults.removeObject(forKey: "switchON")
        //defaults.synchronize()
 //       defaults.removeObject(forKey: "slidON")
 
    }


}

