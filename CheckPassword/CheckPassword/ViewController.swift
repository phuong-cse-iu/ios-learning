//
//  ViewController.swift
//  CheckPassword
//
//  Created by TranTPhuong on 11/29/16.
//  Copyright © 2016 TranTPhuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfInput: UITextField!
    
    @IBOutlet weak var lblDisplay: UILabel!
    let password:String = "abc123"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func txtFieldInputed(_ sender: Any) {
        let inputPassword = tfInput.text!
        var stringPassword:String = ""
        // xu li cho viec tim kiem theo keyword
        let arrPassword:Array<String> = inputPassword.components(separatedBy: " ")
        
        for word in arrPassword {
            stringPassword += word
        }
        
        if password.contains(stringPassword.lowercased()){
            tfInput.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            lblDisplay.text = "Correct password"
            view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        } else {
            tfInput.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            lblDisplay.text = "Wrong password"
        }
    }

}

