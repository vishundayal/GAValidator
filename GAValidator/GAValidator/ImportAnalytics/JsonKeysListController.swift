//
//  JsonKeysListController.swift
//  GAValidator
//
//  Created by Vishun on 09/11/20.
//

import UIKit

class JsonKeysListController: UITableViewController {
    let json: [String:Any]
    let keys: [String]
    init(json:[String:Any]) {
        self.json = json
        self.keys = Array(json.keys)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(JsonKeyCell.self, forCellReuseIdentifier: "JsonKeyCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keys.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JsonKeyCell", for: indexPath) as? JsonKeyCell else {
            return JsonKeyCell()
        }
        let key = keys[indexPath.row]
        if let value = json[key] as? String {
            cell.textLabel?.text = key
            cell.detailTextLabel?.text = value
            cell.accessoryType = .none
        } else {
            cell.textLabel?.text = key
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = keys[indexPath.row]
        if let value = json[key] as? [String:Any] {
            let vc = JsonKeysListController(json: value)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
