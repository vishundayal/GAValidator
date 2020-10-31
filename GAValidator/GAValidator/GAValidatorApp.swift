//
//  GAValidatorApp.swift
//  GAValidator
//
//  Created by Vishun on 11/10/20.
//

import SwiftUI

@main
struct GAValidatorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            MainContentView()
        }
    }
}
