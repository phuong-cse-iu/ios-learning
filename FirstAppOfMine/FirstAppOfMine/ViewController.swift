//
//  ViewController.swift
//  FirstAppOfMine
//
//  Created by TranTPhuong on 11/28/16.
//  Copyright © 2016 TranTPhuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtFieldLbl: UITextField!
    @IBOutlet weak var btnTouch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblTitle.text = "Sorry seem to be a hardest word"
        txtFieldLbl.placeholder = "Enter your song names:😁"
        btnTouch.isHidden = true
    }
    
    
    @IBAction func atxthoten(_ sender: Any) {
        let songName:String = txtFieldLbl.text!
        lblTitle.text = songName
        if songName.characters.count > 10 {
            btnTouch.isHidden = false
        } else {
            btnTouch.isHidden = true
        }
    }
   
    @IBAction func btnPressed(_ sender: Any) {
        
        let hoten:String = lblTitle.text!
        print(hoten)
    }
}

