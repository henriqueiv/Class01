//
//  AppDelegate.swift
//  Class01
//
//  Created by Henrique Valcanaia on 2/29/16.
//  Copyright © 2016 Henrique Valcanaia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let environment = NSProcessInfo.processInfo().environment
        if let testing = environment["isUITest"] where testing == "true" {
            print("----------------------------")
            print("ENVIRONMENT RUNNING UI TESTS")
            print("----------------------------")
        }
        
        return true
    }

}

