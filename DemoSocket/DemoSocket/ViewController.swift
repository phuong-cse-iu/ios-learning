//
//  ViewController.swift
//  DemoSocket
//
//  Created by TranTPhuong on 1/18/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var txtFieldHoTen: UITextField!
    @IBOutlet weak var lblUser1: UILabel!
    @IBOutlet weak var lblUser2: UILabel!
    let socket = SocketIOClient(socketURL: URL(string: "http://192.168.1.101:3000")!, config: [.log(true), .forcePolling(true)])
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = 50

        socket.connect()
        socket.on("user1", callback: {
            (arrData, ack) in
            //print(arrData[0])
            if arrData[0] as? String == self.txtFieldHoTen.text {
                self.lblUser1.text = arrData[0] as? String
                self.lblUser2.text = arrData[1] as? String

            } else {
                self.lblUser1.text = arrData[1] as? String
                self.lblUser2.text = arrData[0] as? String
            }
            
        })
    

        
        socket.on("diem", callback: {
            (arrData, ack) in
            print(arrData)
            
            
            if arrData[0] as? String == self.lblUser1.text! {
                self.slider.value = arrData[1] as! Float
            } else {
                if arrData[2] as? String == self.lblUser2.text! {
                    self.slider.value = arrData[3] as! Float
                } else {
                    
                }
            }
        })
        
    }
    
    
    @IBAction func aSliderKeo(_ sender: Any) {
    }
    
    @IBAction func asldTap(_ sender: Any) {
        print("tap tap")
        socket.emit("taptap", with: [txtFieldHoTen.text!])
    }

    @IBAction func aBtnEmit(_ sender: Any) {
        
        socket.emit("hello", with: [txtFieldHoTen.text!])
        
    

}
}

