//
//  MainContentView.swift
//  GAValidator
//
//  Created by Vishun on 11/10/20.
//

import SwiftUI

struct MainContentView: View {
    let items = [
        ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"],
        ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"],
        ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"]
    ]
    var trackers:[TrackerItem] {
        items.compactMap { (item) -> TrackerItem in
            TrackerItem(content: item, status: .Pending)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                List(trackers) { item in
                    let tracker = TrackerItem(content: item.content, status: .Pending)
                    TrackerItemView(item: tracker)
                }
            }
            .navigationTitle("GA Validator")
            .navigationBarItems(trailing: NavigationLink(
                                    destination: UIHostingController(rootView:SettingsView()),
                                    label: {
                                        Image(systemName: "gear").imageScale(.large)
                                    }))
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
