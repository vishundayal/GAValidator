//
//  SettingsUseCase.swift
//  GAValidator
//
//  Created by Vishun on 05/11/20.
//

import Foundation
import GoogleSignIn

class SettingsUseCase {
    func getAccountSummaries(onCompletion:@escaping ((AccountSummary)->Void)) {
        guard let user = GIDSignIn.sharedInstance()?.currentUser, let accessToken = user.authentication.accessToken else {
            return
        }
        guard var urlComponent = URLComponents(string: "https://www.googleapis.com/analytics/v3/management/accountSummaries") else {
            assertionFailure("Failed to create url object")
            return
        }
        let query1 = URLQueryItem(name: "access_token", value: accessToken)
        let semaphore = DispatchSemaphore (value: 0)
        urlComponent.queryItems = [query1]
        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            let decoder = JSONDecoder()
            if let summary = try? decoder.decode(AccountSummary.self, from: data) {
                onCompletion(summary)
            }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()

    }
}
