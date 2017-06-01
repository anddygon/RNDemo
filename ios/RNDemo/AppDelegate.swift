//
//  AppDelegate.swift
//  RNDemo
//
//  Created by xiaoP on 2017/5/19.
//  Copyright © 2017年 Chicv. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = UIViewController()
        let view = RNModuleManager.shared.viewFor(name: "App", initialProperties: nil)
        rootViewController.view = view
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }


}

