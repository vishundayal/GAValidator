//
//  TrackerItemView.swift
//  GAValidator
//
//  Created by Vishun on 01/11/20.
//

import UIKit

class TrackerItemView: UIView {
    let stackView = UIStackView()
    let titleLabel = UILabel()
    let item: TrackerItem
    init(tracker: TrackerItem) {
        item = tracker
        super.init(frame: .zero)
        titleLabel.numberOfLines = 0
        stackView.addSubview(titleLabel)
        configureViews()
        stackView.addArrangedSubview(titleLabel)
        backgroundColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func willMove(toSuperview newSuperview: UIView?) {
        if let data = try? JSONSerialization.data(withJSONObject: item.content, options: JSONSerialization.WritingOptions.prettyPrinted) {
            titleLabel.text = String(data: data, encoding: .utf8)
        }
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        dropShadow()
    }
    func configureViews() {
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
    }
}
