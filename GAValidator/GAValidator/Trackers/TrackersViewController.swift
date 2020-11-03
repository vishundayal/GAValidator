//
//  TrackersViewController.swift
//  GAValidator
//
//  Created by Vishun on 01/11/20.
//

import UIKit
class TrackersViewController: UIViewController {
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let usecase = TrackerUseCase()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        populateTrackers()
        title = "Trackers"
        addNavigationBarItems()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usecase.validateTrackerGA()
    }
    func addNavigationBarItems() {
        let settings = UIBarButtonItem(image:#imageLiteral(resourceName: "gear.png"), style: .done, target: self, action: #selector(goSettings))
        navigationItem.rightBarButtonItem = settings
    }
    
    @objc func goSettings() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    func configureView() {
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: 0).isActive = true
    }
    
    func populateTrackers() {
        TrackerMockData()
            .trackers
            .forEach {
                stackView.addArrangedSubview(TrackerItemView(tracker: $0))
            }
    }
    
}
