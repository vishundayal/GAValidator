//
//  AccountSummary.swift
//  GAValidator
//
//  Created by Vishun on 05/11/20.
//

import Foundation

import Foundation
struct AccountSummary : Codable {
    let kind : String?
    let username : String?
    let totalResults : Int?
    let startIndex : Int?
    let itemsPerPage : Int?
    let items : [Items]?
}

struct Items : Codable {
    let id : String?
    let kind : String?
    let name : String?
    let webProperties : [WebProperties]?
}


struct WebProperties : Codable {
    let kind : String?
    let id : String?
    let name : String?
    let internalWebPropertyId : String?
    let level : String?
    let profiles : [Profiles]?
}

struct Profiles : Codable {
    let kind : String?
    let id : String?
    let name : String?
    let type : String?
}
