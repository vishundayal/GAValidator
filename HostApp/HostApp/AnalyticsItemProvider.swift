//
//  AnalyticsItemProvider.swift
//  HostApp
//
//  Created by Vishun on 08/11/20.
//

import UIKit


extension UIActivity.ActivityType {
    public static let analytics = UIActivity.ActivityType(rawValue: "public.analytics")
}
class AnalyticsItemProvider: UIActivityItemProvider {
    override var item: Any {
        return "hellow world".data(using: .utf8) ?? Data()
    }
    override var placeholderItem: Any? {
        return "hellow world".data(using: .utf8)
    }
    override var activityType:  UIActivity.ActivityType { return .analytics }
}
