//
//  ManHinhVang.swift
//  PushDemo
//
//  Created by TranTPhuong on 12/14/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ManHinhVang: UIViewController {

    
    @IBOutlet weak var btnVang: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func abtnVang(_ sender: Any) {
        let manhinhdich:ManHinhXanhDuong = storyboard?.instantiateViewController(withIdentifier: "xanhduong") as! ManHinhXanhDuong
        self.navigationController?.pushViewController(manhinhdich, animated: true)
    }
    
}
