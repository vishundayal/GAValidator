//
//  SettingsController.swift
//  GAValidator
//
//  Created by Vishun on 31/10/20.
//

import Foundation
import GoogleSignIn
import SwiftUI

struct SettingsController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SettingsViewController {
        return SettingsViewController()
    }
    func updateUIViewController(_ uiViewController: SettingsViewController, context: Context) {
        
    }
}

class SettingsViewController: UIViewController, GIDSignInDelegate {

    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        debugPrint("accessToken: \(user.authentication.accessToken ?? "No access token")")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGoogleSignIn()
    }
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        debugPrint("\(#function)")
    }
    
    init() {
        debugPrint("\(#function)")
        super.init(nibName:nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        debugPrint("\(#function)")
    }
    func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().clientID = "692092518182-bnp4vfc3cbhktuqskok21sgenq0pn34n.apps.googleusercontent.com"
        let scope = "https://www.googleapis.com/auth/analytics.readonly"
        var scopes = GIDSignIn.sharedInstance()?.scopes ?? []
        scopes.append(scope)
        GIDSignIn.sharedInstance()?.scopes = scopes
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
}
