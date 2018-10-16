//
//  ViewController.swift
//  ex02
//
//  Created by Gaolatlhwe SEBAETSE on 2018/09/30.
//  Copyright © 2018 Gaolatlhwe SEBAETSE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var screen: UILabel!
    
    @IBAction func numberClicked(_ sender: UIButton) {
        screen.text = screen.text! + String(sender.tag - 1)
        print("You pressed number ", sender.tag - 1)
    }
    @IBAction func operatorClicked(_ sender: UIButton) {
        print("You pressed number ", sender.tag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

