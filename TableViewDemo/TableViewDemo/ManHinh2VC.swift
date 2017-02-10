//
//  ManHinh2VC.swift
//  TableViewDemo
//
//  Created by TranTPhuong on 12/21/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ManHinh2VC: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var img: UIImageView!
    var name:String = ""
    var imageName:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblName.text = name
        img.image = UIImage(named: imageName)
    }

}
