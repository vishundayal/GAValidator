//
//  AppDelegate.swift
//  GAValidator
//
//  Created by Vishun on 31/10/20.
//

import Foundation
import GoogleSignIn
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
    -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    var rootViewController: UIViewController? {
        return UIApplication.shared.windows.first?.rootViewController
    }
}
