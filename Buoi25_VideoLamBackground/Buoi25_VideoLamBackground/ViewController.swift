//
//  ViewController.swift
//  Buoi25_VideoLamBackground
//
//  Created by TranTPhuong on 2/6/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var playerLayer:AVPlayerLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playerLayer = AVPlayerLayer()
        let url:URL = URL(string: "http://thaihuynhcong.pe.hu/Video/SING%20-%20Teaser%20Trailer.mp4")!
        playerLayer.player = AVPlayer(url: url)
        
        view.layer.addSublayer(playerLayer)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/2)
        playerLayer.player?.play()
    }


}

