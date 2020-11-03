//
//  SettingsViewController.swift
//  TrackerValidation
//
//  Created by Vishun on 10/10/20.
//

import UIKit
import GoogleSignIn
/*
"profileInfo": {
  "profileId": "100593946",
  "accountId": "9801603",
  "webPropertyId": "UA-9801603-10",
  "internalWebPropertyId": "96430191",
  "profileName": "iOS App Data",
  "tableId": "realtime:100593946"
},
 */
class SettingsViewController: UIViewController, GIDSignInDelegate {
    let signInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Settings"
        setupGoogleSignIn()
    }

    func setupGoogleSignIn() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        view.addSubview(signInButton)
        signInButton.setTitle("Nai dikhne wala button", for: UIControl.State.normal)
        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        signInButton.style = .wide
//        signInButton.colorScheme = .light
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    @IBAction func validateTrackerRealtime() {
        let semaphore = DispatchSemaphore (value: 0)
        var urlComponent = URLComponents(string: "https://www.googleapis.com/analytics/v3/data/realtime")!
        let qi1 = URLQueryItem(name: "ids", value: "ga:100593946")
        let qi2 = URLQueryItem(name: "metrics", value: "rt:activeUsers")
        let qi3 = URLQueryItem(name: "dimensions", value: "rt:medium")
//        let qi4 = URLQueryItem(name: "filters", value: "ga:eventCategory==homepage")
        let qi5 = URLQueryItem(name: "access_token", value: GIDSignIn.sharedInstance()?.currentUser.authentication.accessToken)
        urlComponent.queryItems = [qi1,qi2,qi3,qi5]
        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()

    }
    
    @IBAction func validateTrackerGA() {
        let semaphore = DispatchSemaphore (value: 0)
        var urlComponent = URLComponents(string: "https://www.googleapis.com/analytics/v3/data/ga")!
        let qi1 = URLQueryItem(name: "ids", value: "ga:100593946")
        let qi2 = URLQueryItem(name: "metrics", value: "ga:transactions")
        let qi3 = URLQueryItem(name: "dimensions", value: "ga:transactionId")
        let qi4 = URLQueryItem(name: "filters", value: "ga:transactionId==17081602")
        let qi5 = URLQueryItem(name: "access_token", value: GIDSignIn.sharedInstance()?.currentUser.authentication.accessToken)
        let qi6 = URLQueryItem(name: "start-date", value: "today")
        let qi7 = URLQueryItem(name: "end-date", value: "today")
        urlComponent.queryItems = [qi1,qi2,qi3,qi4,qi5, qi6, qi7]
        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()

    }
    
    
    
    // MARK: GIDSignInDelegate
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
            if error == nil, let token = user.authentication.accessToken {
                print("Did sign in with access token \(token)")
                signInButton.isEnabled = false
            } else {
              print("\(error.localizedDescription)")
            }
        }
        func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
            signInButton.isEnabled = true
            print("Did disconnected")
        }

}

