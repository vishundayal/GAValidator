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
        metrics = ["ga:totalEvents"]
        dimensions = ["ga:eventAction", "ga:eventLabel", "ga:eventCategory"]
        filters = ["ga:eventAction==\(event.eventAction)", "ga:eventCategory==\(event.eventCategory)","ga:eventLabel==\(event.eventLabel)"]
    }
}

struct GTMEvent:Decodable {
    let event: String
    let eventCategory: String
    let eventAction: String
    let eventLabel: String
    var ecommerce: ECommerce?
    var extras: [String: String]?
    init(contents:[String:Any]) {
        event = contents["event"] as? String ?? ""
        eventCategory = contents["eventCategory"] as? String ?? ""
        eventLabel = contents["eventLabel"] as? String ?? ""
        eventAction = contents["eventAction"] as? String ?? ""
        if let ecom = contents["ecommerce"] as? [String: Any] {
            ecommerce = ECommerce(contents: ecom)
        }
    }
}
struct ECommerce: Decodable {
    var products: [Product] = []
    var transactionId: String?
    init(contents:[String:Any]) {
        if let prdts = contents["items"] as? [[String:Any]] {
            prdts.forEach { (dict) in
                products.append(Product(contents: dict))
            }
        }
    }
}
struct Product: Decodable {
    let itemId: String
    let itemName: String
    let price: Float
    init(contents:[String:Any]) {
        itemName = contents["item_name"] as? String ?? ""
        itemId = contents["item_id"]  as? String  ?? ""
        price = contents["price"]  as? Float ?? 0.0
    }
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
