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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return letters.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print("cell.textLabel?.text: \(cell.textLabel?.text ?? "")")
        cell.textLabel?.text = letters[indexPath.row]
        cell.accessoryType = indexPath.row % 2 == 1 ? .checkmark : .none
        return cell
    }
}
