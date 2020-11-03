//
//  TrackerItem.swift
//  GAValidator
//
//  Created by Vishun on 01/11/20.
//

import UIKit

struct TrackerItem: Identifiable {
    var id = UUID()
    let content: [String:String]
    let status: TrackerStatus
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
