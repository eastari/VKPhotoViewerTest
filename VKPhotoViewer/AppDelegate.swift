//
//  AppDelegate.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 04.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//
// 

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let rootRouter = RootRouter()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        rootRouter.setupRouter(window: window!)
       
        return true
    }

    // VK  Initialization
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        VKSdk.processOpenURL(url, fromApplication: sourceApplication)
        return true
    }
    
    @available(iOS 9, *)
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        VKSdk.processOpenURL(url, fromApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as! String)
        return true
    }

}

