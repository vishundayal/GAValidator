//
//  TrackerUseCase.swift
//  GAValidator
//
//  Created by Vishun on 11/10/20.
//

import Foundation
import GoogleSignIn

class TrackerUseCase {
    func validateTrackerGA() {
        guard let user = GIDSignIn.sharedInstance()?.currentUser, let accessToken = user.authentication.accessToken else {
            return
        }
        let semaphore = DispatchSemaphore (value: 0)
        var urlComponent = URLComponents(string: "https://www.googleapis.com/analytics/v3/data/ga")!
        let qi1 = URLQueryItem(name: "ids", value: "ga:100593946")
        let qi2 = URLQueryItem(name: "metrics", value: "ga:transactions")
        let qi3 = URLQueryItem(name: "dimensions", value: "ga:transactionId")
        let qi4 = URLQueryItem(name: "filters", value: "ga:transactionId==17081602")
        let qi5 = URLQueryItem(name: "access_token", value: accessToken)
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
}
