//
//  ViewController.swift
//  Animation2
//
//  Created by TranTPhuong on 12/19/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    let imgArr:Array<String> = ["1","2","3","4","4","5","6","6","8"]
    var index:Int = 0
//    func walk() {
//        index += 1
//        if index == imgArr.count - 1 {
//            index = 0
//        }
//        img.image = UIImage(named: imgArr[index])
//    }
    
    @IBOutlet weak var viewBlue: UIView!
    @IBOutlet weak var viewRed: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.walk), userInfo: nil, repeats: true)
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: {_ in 
            self.index += 1
            if self.index == self.imgArr.count - 1 {
                self.index = 0
            }
            self.img.image = UIImage(named: self.imgArr[self.index])

        })
        
//        let xoayNguoc = CATransform3DRotate(CATransform3DIdentity, CGFloat(M_PI), 1, 0, 0)
//        
//        let ditrai = CATransform3DTranslate(CATransform3DIdentity, view.frame.size.width / 2, 0, 0)
//        let xoayMat = CATransform3DRotate(ditrai, CGFloat(M_PI), 0, 1, 0)
//        let diphai = CATransform3DTranslate(xoayMat, view.frame.size.width / 2, 0, 0)
//        
//        img.layer.transform = xoayNguoc
//       
//
//        UIView.animate(withDuration: 3, animations: {self.img.layer.transform = ditrai }, completion: {(true) in
//            self.img.layer.transform = xoayMat
//            UIView.animate(withDuration: 3, animations: {
//                
//                self.img.layer.transform = diphai
//            })
//        })
        let keoLen = CATransform3DTranslate(CATransform3DIdentity, 0, -view.frame.size.height / 2, 0)
        let keoXuong = CATransform3DTranslate(CATransform3DIdentity, 0, view.frame.size.height / 2, 0)
        let zoomImg = CATransform3DScale(CATransform3DIdentity, 0.1, 0.1, 1)
        img.layer.transform = zoomImg
        UIView.animate(withDuration: 3, animations: {
            self.viewBlue.layer.transform = keoLen
            self.viewRed.layer.transform = keoXuong
            self.img.layer.transform = CATransform3DIdentity
        })
        
    }

  

}

