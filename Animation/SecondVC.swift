//
//  SecondVC.swift
//  Animation
//
//  Created by TranTPhuong on 12/12/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    var imgName:String = ""

    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        img.image = UIImage(named: imgName)
    }
    
    @IBAction func btn(_ sender: Any) {
        // quay ve dung man hinh truoc do
        // neu dung segue thi se tao ra man hinh moi chong len nhau
        // tu ViewController -> SecondVC dung segue tao ra mot man hinh moi(man hinh thu 2)
        // tu SecondVC quay tro ve ViewController tao ra man hinh moi(man hinh thu 3)
        
        // dung dismiss de quay dung tro ve man hinh truoc do
        // user experience: form nguoi dung, user nhap textfield, neu chuyen man hinh, sau do quay tro ve man hinh chu form, du lieu trong textfield van con 
        
        // dimiss, xoa man hinh
        dismiss(animated: true, completion: nil)
    }

}
