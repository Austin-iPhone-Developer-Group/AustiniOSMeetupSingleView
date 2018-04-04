//
//  ViewController.swift
//  AustiniOSMeetupSingleView
//
//  Created by Murray Sagal on 2017-12-05.
//  Copyright © 2017 Austin-iOS-Developer-Group. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let letters = "abcdefghijklmnopqrstuvwxyz".map {return String($0)}
    var indexPathForCheckedRow: IndexPath?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // set to zero to turn off the table view
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return letters.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = letters[indexPath.row]
        cell.accessoryType = self.indexPathForCheckedRow == indexPath ? .checkmark : .none
        cell.selectionStyle = .none
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        guard self.indexPathForCheckedRow != indexPath else {
            cell.accessoryType = .none
            self.indexPathForCheckedRow = nil
            return
        }
        cell.accessoryType = .checkmark
        self.indexPathForCheckedRow = indexPath
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        cell.accessoryType = .none
        self.indexPathForCheckedRow = nil
    }
}
