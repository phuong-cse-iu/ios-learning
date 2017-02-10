//
//  ViewController.swift
//  GestureDemo
//
//  Created by TranTPhuong on 12/16/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
   
    @IBOutlet weak var slider: UISlider!
    func roi() {
       imgView.frame.origin.y += 10
    }
    
    
    @IBAction func aGesture(_ sender: Any) {
        switch sender {
        case is UITapGestureRecognizer:
            print("Dog tapped")
        case is UIPinchGestureRecognizer:
            imgView.layer.transform = CATransform3DScale(CATransform3DIdentity, (sender as AnyObject).scale, (sender as AnyObject).scale, 0)
        case is UIRotationGestureRecognizer:
            imgView.layer.transform = CATransform3DRotate(CATransform3DIdentity, (sender as AnyObject).rotation, 0, 0, 1)
        case is UILongPressGestureRecognizer:
            print((sender as AnyObject).location(in: view))
//        case is UIPanGestureRecognizer:
//            imgView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, (sender as AnyObject).translation(in: view).x, (sender as AnyObject).translation(in: view).y, 0)
        case is UISwipeGestureRecognizer:
            print("luot")
        case is UIScreenEdgePanGestureRecognizer:
            print("luot tu canh")
        default:
            print("loi")
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == UIEventSubtype.motionShake {
            print("dang lac")
        }
    }
    
    @IBAction func imgTapped(_ sender: UITapGestureRecognizer) {
        print("Dog tapped")
        imgView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, -20, 0)
    }
    
    @IBAction func pinchGestureImg(_ sender: UIPinchGestureRecognizer) {
        print(sender.scale)
        // frame se scale hinh tu tam
        //imgView.frame.size = CGSize(width: 50 * sender.scale, height: 50 * sender.scale)
        // CATransform3DIndetity: hinh dang ban dau cua doi tuong
        
    }
    func animationImg() {
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animationImg), userInfo: nil, repeats: true)
        slider.layer.transform = CATransform3DRotate(CATransform3DIdentity, CGFloat(M_PI / 2), 0, 0, 1)
        
        UIView.animate(withDuration: 2, animations: {
            self.imgView.layer.transform = CATransform3DScale(CATransform3DIdentity, 2, 2, 1)
        })
        
        // lam xong roi, completion lam gi ke tiep

    }

 
}

