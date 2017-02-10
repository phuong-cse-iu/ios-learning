//
//  ViewController.swift
//  Animation
//
//  Created by TranTPhuong on 12/12/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var index:Int = 0
    var timer:Timer = Timer()
    
    @IBOutlet weak var txtFieldInput: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    let arrImg:Array<String> = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    
    func action() {
        index += 1
        if index == arrImg.count {
            index = 0
        }
        image.image = UIImage(named: arrImg[index])
    }
    
    // dung viewDidLayoutSubviews de cap nhat khi load du lieu
    override func viewDidLayoutSubviews() {
        if timer.isValid == false {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
    }

    @IBAction func btnChangeScreen(_ sender: Any) {
        // tao man hinh dich tu file storyboar 
//        let manhinhdich:SecondVC = storyboard?.instantiateViewController(withIdentifier: "SecondScreen") as! SecondVC
//        // present di voi dimiss
//        // present dung man hinh
//        timer.invalidate()
//        manhinhdich.imgName = arrImg[index]
//        present(manhinhdich, animated: true, completion: nil)
        
//        let manhinh1:SecondVC = storyboard?.instantiateViewController(withIdentifier: "SecondScree") as! SecondVC
//        
//        let manhinh2:ThirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdScreen") as! ThirdVC
//        if txtFieldInput.text == "1" {
//            present(manhinh1, animated: true, completion: nil)
//        } else if txtFieldInput.text == "2" {
//            present(manhinh2, animated: true, completion: nil)
//        }
    }
    
    
    @IBAction func txtFieldInputted(_ sender: Any) {
        let manhinh1:SecondVC = storyboard?.instantiateViewController(withIdentifier: "SecondScreen") as! SecondVC
        
        
        
        let manhinh2:ThirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdScreen") as! ThirdVC
        if txtFieldInput.text == "1" {
            present(manhinh1, animated: true, completion: nil)
        } else if txtFieldInput.text == "2" {
            present(manhinh2, animated: true, completion: nil)
        }
    }
    
}



