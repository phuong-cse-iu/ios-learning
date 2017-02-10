//
//  Song.swift
//  WebServiceDemo
//
//  Created by TranTPhuong on 1/2/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import Foundation
import UIKit

struct Song {
    var idSong:String
    var songTitle:String
    var link:String
    
    init(object:AnyObject) {
        let dict:Dictionary<String, AnyObject> = object as! Dictionary<String, AnyObject>
        idSong = dict["idBH"] as! String
        songTitle = dict["tenBH"] as! String
        link = dict["link"] as! String
    }
    
    init() {
        idSong = ""
        songTitle = ""
        link = ""
    }
}
