//
//  secondViewController.swift
//  ex02
//
//  Created by Gaolatlhwe SEBAETSE on 2018/10/04.
//  Copyright © 2018 Gaolatlhwe SEBAETSE. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var doneBTN: UIBarButtonItem!
    
    @IBOutlet weak var infoLabel: UITextView!
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var dateLabel: UIDatePicker!
    
    @IBAction func printConsole(_ sender: UIBarButtonItem) {
       // print("test")
//
//        print(nameLabel.text ?? "Name not set")
//        print(infoLabel.text)
//        print(dateLabel)
//
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM YYYY H:mm:ss"
        
        print("Name : ", nameLabel.text ?? "No One")
        print("Date of Death : ", dateFormatter.string(from: dateLabel.date))
        print("Died by : ", infoLabel.text)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.minimumDate = Date()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
