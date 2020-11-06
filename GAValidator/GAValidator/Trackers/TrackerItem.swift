//
//  TrackerItem.swift
//  GAValidator
//
//  Created by Vishun on 01/11/20.
//

import UIKit

struct TrackerItem: Identifiable {
    var id = UUID()
    let content: [String:Any]?
    let status: TrackerStatus
    var event: GTMEvent?
    var validator: TrackerValidator?
    init(data:Data) {
        content = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]
        status = .Pending
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let gtm = try? decoder.decode(GTMEvent.self, from: data) {
            event = gtm
            validator = TrackerValidator(event: gtm)
        }
    }
}
struct TrackerValidator {
    let metrics:[String]
    let dimensions:[String]
    let filters:[String]
    var startDate = Date()
    var endDate = Date()
    init(event: GTMEvent) {
        if let transactionId = event.transactionId {
            metrics = ["ga:transactions"]
            dimensions = ["ga:transactionId"]
            filters = ["ga:transactionId==\(transactionId)"]
        } else {
            metrics = ["ga:totalEvents"]
            dimensions = ["ga:eventAction", "ga:eventLabel", "ga:eventCategory"]
            filters = ["ga:eventAction==\(event.eventAction)", "ga:eventCategory==\(event.eventCategory)","ga:eventLabel==\(event.eventLabel)"]
        }
    }
}

struct GTMEvent:Decodable {
    let event: String
    let eventCategory: String
    let eventAction: String
    let eventLabel: String
    let transactionId: String?
    var ecommerce: ECommerce?
    var extras: [String: String]?
}
struct ECommerce: Decodable {
    var products: [Product] = []
    var transactionId: String?
}
struct Product: Decodable {
    let itemId: String
    let itemName: String
    let price: Float
}
enum TrackerStatus {
    case Verified(state:TrackerVerifiedStatus)
    case Pending
    var borderColor: UIColor {
        switch self {
        case let .Verified(state):
            if state == .Success {
                return .green
            } else {
                return .red
            }
        case .Pending:
            return .gray
        }
    }
}

enum TrackerVerifiedStatus {
    case Success, Failure
}
