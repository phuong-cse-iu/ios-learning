//
//  PlayVC.swift
//  ZingLayoutClone
//
//  Created by TranTPhuong on 12/5/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import UIKit
import AVFoundation
var player:AVAudioPlayer = AVAudioPlayer()
var firstLoad:Bool = false
class PlayVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblMinTime: UILabel!
    @IBOutlet weak var lblMaxTime: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var disc: UIImageView!
    @IBOutlet weak var txtFieldLyric: UITextView!
    var song = Song()
    // tao player chua noi dung bai nhac chuan bi phat
    
    
    var timer:Timer = Timer()
    var timerRotate:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblTitle.text = song.songName
        txtFieldLyric.text = song.lyric
        // duong dan toi bai hat
        
//        loadSongLocal(name: "yeu")
//        player.play()
        loadSongOnline(link: "http://hidaacademy.com/AiRoiCungKhac-HamletTruong.mp3")
        
        
        
        
    }
    
    func rotate() {
        let transform = CATransform3DRotate(CATransform3DIdentity, CGFloat(M_PI), 0, 0, 1)
        UIView.animate(withDuration: 1.5, animations: { self.disc.layer.transform = transform }, completion: {
            (true) in
            UIView.animate(withDuration: 1.5, animations: {
                self.disc.layer.transform = CATransform3DIdentity
            })
        })
       
    }
    
    func loadSongLocal(name: String) {
        let path = Bundle.main.path(forResource: name, ofType: "mp3")
        let url:URL = URL(fileURLWithPath: path!)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            lblMaxTime.text = String(Int(player.duration))
            slider.minimumValue = 0
            slider.maximumValue = Float(player.duration)
            slider.value = 0
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayVC.update), userInfo: nil, repeats: true)
        } catch {
            print("error")
        }
    }
    
    
    func loadSongOnline(link: String) {
        let url = URL(string: link)
        let queue = DispatchQueue(label: "downloadmp3")
        queue.async {
            do {
                let data = try Data(contentsOf: url!)
                player = try AVAudioPlayer(data: data)
                
            } catch {
                print("error")
            }

        }
        
    }
    
    
    func update() {
        slider.value = Float(Int(player.currentTime))
        lblMaxTime.text = convertSecondToString(time: Int(player.duration) - Int(player.currentTime))
        
        lblMinTime.text = convertSecondToString(time: 0 + Int(player.currentTime))
        
    }
    
    func convertSecondToString(time: Int) -> String {
        // giay < 10 & phut < 10 --> ophut: 0giay
        // giay >= 10 & phut < 10 --> 0phut:giay
        // giay >= 10 & phut >= 10 --> phut:giay
        // giay < 10 & phut >= 10 --> phut:0giay
        let phut:Int = time / 60
        let giay:Int = time % 60
        
        if giay < 10 && phut < 10 {
            return "0\(phut):0\(giay)"
        }
        
        if giay >= 10 && phut < 10 {
            return "0\(phut):\(giay)"
        }
        
        if giay >= 10 && phut >= 10 {
            return "\(phut):\(giay)"
        }
        
        if giay < 10 && phut >= 10 {
            return "\(phut):0\(giay)"
        }
        
        return ""
    }
    
    @IBAction func aSlider(_ sender: Any) {
        player.currentTime = TimeInterval(slider.value)
    }
    @IBAction func playBtn(_ sender: Any) {
        if player.isPlaying == false {
            player.play()
            playBtn.setImage(UIImage(named: "pause (2)"), for: .normal)
            timerRotate = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.rotate), userInfo: nil, repeats: true)
        } else {
            player.pause()
            playBtn.setImage(UIImage(named: "play-button (2)"), for: .normal)
            timerRotate.invalidate()
        }
        
        
        
    }
    func rotateDisc() {
        let rotation = CATransform3DRotate(CATransform3DIdentity, CGFloat(M_PI), 0, 0, 1)
        UIView.animate(withDuration: 5, animations: { self.disc.layer.transform = rotation }, completion: { (true) in
            self.rotateDisc()
        })
        
        
    }



}




