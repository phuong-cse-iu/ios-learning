//
//  ViewController.swift
//  GCD
//
//  Created by TranTPhuong on 12/25/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    let img:Array<String> = ["http://img.saobiz.net/d/2015/07/tai-hinh-anh-nen-phong-canh-dep-5.png", "http://thietkemythuat.com/news/wp-content/uploads/postlogoeduvn38.png", "http://phaluongmocchau.com/Images/images/tin%20tuc/3.png", "http://ngocthach.vn/wp-content/uploads/2016/02/tranh-phong-thuy-mua-thu.png", "http://img.guucontrai.com/image/2016/07/mai-chau-ecolodge-voi-phong-canh-tho-mong-cua-mien-tay-bac.png"]
    var index:Int = 0
    @IBOutlet weak var lblIndex: UILabel!
    var data:Data?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        qualityOfService()
//        concurrentQueues()
    }
    
    
    func concurrentQueues() {
        let concurrenetQueue = DispatchQueue(label: "com.Trunky.Foundation.concurrentQueue", qos: .utility, attributes: .concurrent)
        concurrenetQueue.async {
            for i in 0...10 {
                print("🐥", i)
            }

        }
        
        concurrenetQueue.async {
            for i in 100...110 {
                print("🐤", i)
            }
            
        }
        
//        concurrenetQueue.async {
//            for i in 1000...1010 {
//                print("😚", i)
//            }
//            
//        }
    }
    
    func qualityOfService() {
        let queue1 = DispatchQueue(label: "com.Trunky.Foundation.queue1", qos: .userInitiated)
        let queue2 = DispatchQueue(label: "com.Trunky.Foundation.queue2", qos: .utility)
        
        queue1.async {
            for i in 0...10 {
                print("🐥", i)
            }
        }
        
        queue2.async {
            for i in 100...110 {
                print(" 🐱 ", i)
            }
        }
        
        for i in 1000...1010 {
            print("😡", i)
        }
        
        
    }
    
//    @IBAction func btnPressed(_ sender: Any) {
//        print("button clicked")
//        index += 1
//        if index == self.img.count - 1 {
//            index = 0
//        }
////        do {
////            let data = try Data(contentsOf: URL(string: img[index])!)
////            imgView.image = UIImage(data: data)
////        } catch {
////            print("error")
////        }
//        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: DispatchQueue.Attributes.concurrent)
//        concurrentQueue.async {
//            // download data from internet
//            do {
//                let url = URL(string: self.img[self.index])
//                self.data = try Data(contentsOf: url!)
//            } catch {
//                print("error")
//            }
//            
//            
//            
//            DispatchQueue.main.async {
//                // update ui
//               
//                self.imgView.image = UIImage(data: self.data!)
//            }
//            
//            
//        }
//
//    }

}

