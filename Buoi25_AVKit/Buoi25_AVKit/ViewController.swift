//
//  ViewController.swift
//  Buoi25_AVKit
//
//  Created by TranTPhuong on 2/6/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    var playerController:AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playerController = AVPlayerViewController()
        
        let path:String = Bundle.main.path(forResource: <#T##String?#>, ofType: <#T##String?#>)!
        let url:URL = URL(fileURLWithPath: <#T##String#>)
        playerController.player = AVPlayer(url: <#T##URL#>)
        playerController.showsPlaybackControls = false
        // khong cho nguoi dung tuong tac voi video
        playerController.view.isUserInteractionEnabled = false
        // chinh kich co cho video
        playerController.videoGravity = AVLayerVideoGravityResize
        // them view cua playerController
        view.addSubview(playerController.view)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        <#code#>
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.width > size.height {
            playerController.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            
        } else {
            playerController.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2)
            
        }
    }
    
    
    

}

