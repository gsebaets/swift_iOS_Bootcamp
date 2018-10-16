//
//  ViewController.swift
//  ex00
//
//  Created by Gaolatlhwe SEBAETSE on 2018/10/04.
//  Copyright © 2018 Gaolatlhwe SEBAETSE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.deaths.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deathCell")
        cell?.textLabel?.text = Data.deaths[indexPath.row].0
        cell?.detailTextLabel?.text = Data.deaths[indexPath.row].1
        return cell!
    }
}

