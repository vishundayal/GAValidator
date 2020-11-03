//
//  TrackerMockData.swift
//  GAValidator
//
//  Created by Vishun on 01/11/20.
//

import Foundation
struct TrackerMockData {
    let items = [
        ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"],
        ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"],
        ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"],
        ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"],
        ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"],
        ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"],
        ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"]
    ]
    var trackers:[TrackerItem] {
        items.compactMap { (item) -> TrackerItem in
            TrackerItem(content: item, status: .Pending)
        }
    }

}
