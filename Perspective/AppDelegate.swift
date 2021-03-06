//
//  AppDelegate.swift
//  Perspective
//
//  Created by Cooper Luetje on 10/18/16.
//  Copyright © 2016 Cooper Luetje. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Style for tab bar
        UITabBar.appearance().barStyle = UIBarStyle.black
        UITabBar.appearance().barTintColor = UIColor(red: 43/255, green: 61/255, blue: 107/255, alpha:1.0)
        UITabBar.appearance().tintColor = UIColor.white        
        
        //Style for nav bars
        if let font = UIFont(name: "Helvetica-Bold", size: 20)
        {
            UINavigationBar.appearance().titleTextAttributes = [ NSFontAttributeName: font]
            UINavigationBar.appearance().barStyle = UIBarStyle.black
            UINavigationBar.appearance().barTintColor = UIColor(red: 43/255, green: 61/255, blue: 107/255, alpha:1.0)
            UINavigationBar.appearance().tintColor = UIColor.white
        }
        
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
        
        //If user is already logged in
        let defaults = UserDefaults.standard
        let key = "user"
        if defaults.object(forKey: key) != nil
        {
            if let value = defaults.object(forKey: key) as? NSData
            {
                let user = NSKeyedUnarchiver.unarchiveObject(with: value as Data) as! User
                if user.auth_token != ""
                {                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
                    let sessionService:SessionService = SessionService()
                    sessionService.verify(username: user.username, auth_token: user.auth_token)
                    
                    self.window?.rootViewController = viewController
                }
            }
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

