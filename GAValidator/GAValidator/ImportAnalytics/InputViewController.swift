//
//  InputViewController.swift
//  GAValidator
//
//  Created by Vishun on 09/11/20.
//

import UIKit

class InputViewController: UIViewController {
    @IBOutlet var transactionIdButton: UIButton!
    @IBOutlet var dateButton: UIButton!
    let json: [String:Any]
    init(json:[String:Any]) {
        self.json = json
        super.init(nibName: nil, bundle: nil)
    }
    var isPurchaseEvent: Bool {
        return json["transaction_id"] != nil
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateButtons()
    }

    @IBAction func dateAction() {
        let vc = JsonKeysListController(json: json)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func transactionKeyAction() {
        let vc = JsonKeysListController(json: json)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func updateButtons() {
        if let timestamp = json["event_date"] as? Double  {
            let date = Date(timeIntervalSince1970: timestamp)
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            let title = "Event date - \(formatter.string(from: date))"
            dateButton.setTitle(title, for: .normal)
        }
        if let transactionId = json["transaction_id"] as? String {
            transactionIdButton.setTitle("transaction_id - \(transactionId) \n Click to change", for: .normal)
        } else {
            let alert = UIAlertController(title: "Not Purchase event", message: "Currently we could not recognise this event uniquely over GA.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: {[weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            })
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
