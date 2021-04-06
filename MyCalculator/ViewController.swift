//
//  ViewController.swift
//  MyCalculator
//
//  Created by konstantin on 26/05/2019.
//  Copyright © 2019 konstantin. All rights reserved.
//

import UIKit
// Установка переменных
var numberForScreen:Double = 0
var firstNum:Double = 0
var operation:Int = 0
var mathSign:Bool = false

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
        
        numberForScreen = Double(result.text!)!
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            
            if sender.tag == 11 { // Деление
                result.text = "/"
            }
            else if sender.tag == 12 { // Умножение
                result.text = "*"
            }
            else if sender.tag == 13 { // Вычитание
                result.text = "-"
            }
            else if sender.tag == 14 { // Сложение
                result.text = "+"
                
            }
            
            mathSign = true
            operation = sender.tag
        }
        
        else if sender.tag == 15 { // Посчитать всё
            if operation == 11{
                result.text = String(firstNum / numberForScreen)
            }
            else if operation == 12{
                result.text = String(firstNum * numberForScreen)
            }
            else if operation == 13{
                result.text = String(firstNum - numberForScreen)
            }
            else if operation == 14{
                result.text = String(firstNum + numberForScreen)
            }
        }
        else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            numberForScreen = 0
            operation = 0
        }
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

