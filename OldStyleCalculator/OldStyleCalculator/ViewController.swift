//
//  ViewController.swift
//  OldStyleCalculator
//
//  Created by TranTPhuong on 12/2/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    
    var numOne:Int!
    var numTwo:Int!
    var operation:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblResult.text = ""
    }

  
    @IBAction func btnClear(_ sender: Any) {
        lblResult.text = ""
    }
    @IBAction func btnZero(_ sender: Any) {
        var result:String = lblResult.text!
        result += "0"
        lblResult.text = result
    }
    
    @IBAction func btnOne(_ sender: Any) {
        var result:String = lblResult.text!
        result += "1"
        lblResult.text = result

    }
    
    @IBAction func btnTwo(_ sender: Any) {
        var result:String = lblResult.text!
        result += "2"
        lblResult.text = result

    }
    
    @IBAction func btnThree(_ sender: Any) {
        var result:String = lblResult.text!
        result += "3"
        lblResult.text = result

    }
    
    @IBAction func btnFour(_ sender: Any) {
        var result:String = lblResult.text!
        result += "4"
        lblResult.text = result

    }
    
    @IBAction func btnFive(_ sender: Any) {
        var result:String = lblResult.text!
        result += "5"
        lblResult.text = result

    }
    
    
    @IBAction func btnSix(_ sender: Any) {
        var result:String = lblResult.text!
        result += "6"
        lblResult.text = result

    }
    
    @IBAction func btnSeven(_ sender: Any) {
        var result:String = lblResult.text!
        result += "7"
        lblResult.text = result

    }
    
    @IBAction func btnEight(_ sender: Any) {
        var result:String = lblResult.text!
        result += "8"
        lblResult.text = result

    }
    
    @IBAction func btnNine(_ sender: Any) {
        var result:String = lblResult.text!
        result += "9"
        lblResult.text = result

    }
    
    @IBAction func btnDivide(_ sender: Any) {
        let num1:String = lblResult.text!
        numOne = Int(num1)!
        lblResult.text = ""
        
        operation = "/"
    }
    
    
    @IBAction func btnMultiply(_ sender: Any) {
        let num1:String = lblResult.text!
        numOne = Int(num1)!
        lblResult.text = ""
        
        operation = "x"
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let num1:String = lblResult.text!
        numOne = Int(num1)!
        lblResult.text = ""
        
        operation = "+"
    }
    
    @IBAction func btnSubtract(_ sender: Any) {
        let num1:String = lblResult.text!
        numOne = Int(num1)!
        lblResult.text = ""
        
        operation = "-"
    }
    
    @IBAction func btnEqual(_ sender: Any) {
        let num2:String = lblResult.text!
        numTwo = Int(num2)!
        
        var result:Int = 0
        if operation == "+" {
            result = numOne + numTwo
        }
        
        if operation == "-" {
            result = numOne - numTwo
        }
        
        if operation == "x" {
            result = numOne * numTwo
        }
        
        if operation == "/" {
            result = numOne / numTwo
        }
        
        lblResult.text = String(result)
        
    }
    
    
    
    
    
}

