//
//  JsonPreviewController.swift
//  GAValidator
//
//  Created by Vishun on 08/11/20.
//

import UIKit

class JsonPreviewController: UIViewController {
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    let json: [String:Any]
    init(json:[String:Any]) {
        self.json = json
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = try? JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) {
            textLabel.text = String(data: data, encoding: .utf8)
        }
    }
}
