//
//  AppDelegate.swift
//  Hypnosystem
//
//  Created by Johanna Lichtman on 2/16/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIScrollViewDelegate {

    var window: UIWindow?
    var miniMap: MiniMapView?
    var hypnosisView: HypnosisView?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let settings = UIUserNotificationSettings(forTypes: .Alert, categories: nil)
        application.registerUserNotificationSettings(settings)
        
        let hvc = HypnosisViewController()
        
        // need to call main(bundle) to get access to .nib and .xib files
        //let appBundle = NSBundle.mainBundle()
        //let rvc = ReminderViewController(nibName: "ReminderViewController", bundle: appBundle)
        let rvc = ReminderViewController()
        
        let tbc = UITabBarController()
        tbc.viewControllers = [hvc, rvc]
        
        window!.rootViewController = tbc
        
        window!.backgroundColor = UIColor.whiteColor()
        window!.makeKeyAndVisible()
        
        return true
    }
    
    
    // needs to be outside application class
    func scrollViewDidScroll(scrollView: UIScrollView){
        miniMap?.updateWithScrollView(scrollView)
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return hypnosisView
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

