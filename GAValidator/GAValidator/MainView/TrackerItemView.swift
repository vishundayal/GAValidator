//
//  TrackerItemView.swift
//  GAValidator
//
//  Created by Vishun on 11/10/20.
//

import SwiftUI

enum TrackerStatus {
    case Verified(state:TrackerVerifiedStatus)
    case Pending
    var borderColor: Color {
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

struct TrackerItem: Identifiable {
    var id = UUID()
    let content: [String:String]
    let status: TrackerStatus
}

struct TrackerItemView: View {
    let item: TrackerItem
    let usecase = UseCase()
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 20)
            VStack (alignment: .leading, spacing: 5) {
                Text("Metrics - ga:transactions")
                Text("Dimenstions - ga:transactionId")
                Text("Filter - ga:transactionId==17081602")
                HStack (alignment: .center, spacing: 100) {
                    Button(action: {
                        print("Validate button clicked")
                        usecase.validateTrackerGA()
                    }, label: {
                        Text("Validate")
                    })
                    .foregroundColor(.blue)
                    .buttonStyle(BorderlessButtonStyle())
                    Button(action: {print("Delete button clicked")}, label: {
                        Text("Delete1")
                    })
                    .foregroundColor(.blue)
                    .buttonStyle(BorderlessButtonStyle())
                }
                
            }
            .padding(10)
            .multilineTextAlignment(.leading)
        }
    }
}

struct TrackerItemView_Previews: PreviewProvider {
    static var previews: some View {
        let item = ["Metrics":"ga:transactions", "Dimenstions":"ga:transactionId", "Filter":"ga:transactionId==17081602"]
        let tracker = TrackerItem(content: item, status: .Pending)
        TrackerItemView(item: tracker)
    }
}
