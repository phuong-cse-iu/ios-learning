//
//  ViewController.swift
//  PushDemo
//
//  Created by TranTPhuong on 12/14/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

// 

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var btnDo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func abtnDo(_ sender: Any) {
        let manhinhdich:ManHinhXanh = storyboard?.instantiateViewController(withIdentifier: "xanh") as! ManHinhXanh
        
        self.navigationController?.pushViewController(manhinhdich, animated: true)
    }
}

