//
//  FirstViewController.swift
//  ex00
//
//  Created by Gaolatlhwe SEBAETSE on 2018/10/08.
//  Copyright © 2018 Gaolatlhwe SEBAETSE. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
    }
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell")
        cell?.textLabel?.text = Data.places[indexPath.row].0
        cell?.detailTextLabel?.text = Data.places[indexPath.row].1
        return cell!
    }
}

