//
//  ViewController.swift
//  ex02
//
//  Created by Gaolatlhwe SEBAETSE on 2018/09/30.
//  Copyright © 2018 Gaolatlhwe SEBAETSE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber:Double = 0;
    var previousNumber:Double = 0;
    var calculating = false;
    var operation = 0;
    var done:Bool = false;
    var operatedOn = ""
    

    @IBOutlet weak var screen: UILabel!
    
    @IBAction func numberClicked(_ sender: UIButton) {
        if(done == true)
        {
            screen.text = "";
            done = false;
        }
        
        if(calculating == true)
        {
            screen.text = String(sender.tag - 1)
            currentNumber = Double(screen.text!)!
            calculating = false
        }
        else
        {
            screen.text = screen.text! + String(sender.tag - 1)
            currentNumber = Double(screen.text!)!
        }
        print("You pressed number ", sender.tag - 1)
        
    }
    @IBAction func operatorClicked(_ sender: UIButton) {
        print("You pressed number ", sender.tag)
        if(screen.text != "" && sender.tag != 11 && sender.tag != 17){
            
            previousNumber = Double(screen.text!)!
            if sender.tag == 13 // Devide
            {
                doingMeth(sign: operatedOn)
                operatedOn = "÷"
                print("÷")
            }
            else if sender.tag == 14 //multiply
            {
                doingMeth(sign: operatedOn)
                operatedOn = "*"
                print("x")
            }
            else if sender.tag == 15 //adding
            {
                doingMeth(sign: operatedOn)
                operatedOn = "+"
                print("+")
            }
            else if sender.tag == 16 //minus
            {
                doingMeth(sign: operatedOn)
                operatedOn = "-"
                print("-")
            }
            else if sender.tag == 12
            {
                print("make negative")
                screen.text = String(currentNumber * (-1))
            }
            operation = sender.tag
            calculating = true;
        }
        else if sender.tag == 17
        {
            if operation == 13
            {
               if currentNumber == 0
                {
                    print("Error")
                    screen.text = ""
                    currentNumber = 0;
                    previousNumber = 0;
                    operation = 0;
                }
                else
               {
                screen.text = String(previousNumber / currentNumber)
                }
            }
            else if operation == 14
            {
                print("=")
                screen.text = String(previousNumber * currentNumber)
            }
            else if operation == 15
            {
                print("=")
                screen.text = String(previousNumber + currentNumber)
            }
            else if operation == 16
            {
                print("=")
                screen.text = String(previousNumber - currentNumber)
            }
            else if operation == 12
            {
                screen.text = String(currentNumber)
            }
            done = true;
            operatedOn = ""
        }
        
        else if sender.tag == 11
        {
        print("reset")
        screen.text = ""
        currentNumber = 0;
        previousNumber = 0;
        operation = 0;
        operatedOn = ""
        }
    }
    
    func doingMeth(sign: String) {
        if (sign != "")
        {
            if operatedOn == "/"
            {
                if currentNumber == 0
                {
                    print("Error")
                    screen.text = ""
                    currentNumber = 0;
                    previousNumber = 0;
                    operation = 0;
                }
                else
                {
                    previousNumber = (previousNumber / currentNumber)
                }
            }
            else if operatedOn == "*"
            {
                previousNumber = (previousNumber * currentNumber)
            }
            else if operatedOn == "+"
            {
                previousNumber = (previousNumber + currentNumber)
            }
            else if operatedOn == "-"
            {
                previousNumber = (previousNumber - currentNumber)
            }
        }
        
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
