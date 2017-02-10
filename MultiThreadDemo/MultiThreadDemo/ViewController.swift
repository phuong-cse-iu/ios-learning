//
//  ViewController.swift
//  MultiThreadDemo
//
//  Created by TranTPhuong on 12/30/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnPressed(_ sender: Any) {
//        let url = URL(string: "http://file4.batdongsan.com.vn/2015/05/22/JGcIp0rf/20150522142522-4f74.jpg")
//        let queue = DispatchQueue(label: "queue")
//        queue.async {
//            do {
//                let data = try Data(contentsOf: url!)
//                DispatchQueue.main.async {
//                    self.imageView.image = UIImage(data: data)
//                }
//            } catch {
//                
//            }
//        }
        
        imageView.loadImageFromInternet(url: "http://file4.batdongsan.com.vn/2015/05/22/JGcIp0rf/20150522142522-4f74.jpg")

    }


}

extension UIImageView {
    func loadImageFromInternet(url: String) {
        let url = URL(string: url)
        let queue = DispatchQueue(label: "queue")
        queue.async {
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } catch {
                
            }
        }
     
    }
}

