//
//  SceneDelegate.swift
//  TrackerValidation
//
//  Created by Vishun on 10/10/20.
//

import GoogleSignIn
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigation = UINavigationController(rootViewController: TrackersViewController())
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        setupGoogleSignIn()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
//        guard UIPasteboard.general.types.contains("item.analytics.gavalidator") else {
//            return
//        }
        debugPrint(UIPasteboard.general.types)
        if let analytics = UIPasteboard.general.value(forPasteboardType: "item.analytics.gavalidator") as? Data{
            debugPrint(analytics)
            do {
                let obj = try JSONSerialization.jsonObject(with: analytics, options: .fragmentsAllowed) as! [String : Any]
                showAlert(analytics: obj)
                debugPrint(obj)
            } catch {
                debugPrint(error)
            }
            let text = String(data: analytics, encoding: .utf8)
//            debugPrint(text)
        }
    }
    func showAlert(analytics: [String:Any]) {
        guard let nav = self.window?.rootViewController as? UINavigationController, let topController = nav.topViewController else { return }
        let alert = UIAlertController(title: "Analytics Copied", message: "Do you want to add this analytics?", preferredStyle: .alert)
        let noButton = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: {_ in })
        alert.addAction(noButton)
        let yesButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {_ in
            let viewController = JsonPreviewController(json: analytics)
            let navController = UINavigationController(rootViewController: viewController)
            navController.modalPresentationStyle = .fullScreen
            topController.present(navController, animated: true, completion: nil)
        })
        alert.addAction(yesButton)
        topController.present(alert, animated: true)
    }
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().clientID = "692092518182-bnp4vfc3cbhktuqskok21sgenq0pn34n.apps.googleusercontent.com"
        let scope = "https://www.googleapis.com/auth/analytics.readonly"
        var scopes = GIDSignIn.sharedInstance()?.scopes ?? []
        scopes.append(scope)
        GIDSignIn.sharedInstance()?.scopes = scopes
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
}

