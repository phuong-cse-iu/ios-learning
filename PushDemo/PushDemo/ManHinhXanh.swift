//
//  ManHinhXanh.swift
//  PushDemo
//
//  Created by TranTPhuong on 12/14/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ManHinhXanh: UIViewController {

    @IBOutlet weak var btnXanh: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func abtnXanh(_ sender: Any) {
        let manhinhdich: UINavigationController = storyboard?.instantiateViewController(withIdentifier: "nav2") as! UINavigationController
        present(manhinhdich, animated: true, completion: nil)
    }


}
