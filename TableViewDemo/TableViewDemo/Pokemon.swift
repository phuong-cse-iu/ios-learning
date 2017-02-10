//
//  Pokemon.swift
//  TableViewDemo
//
//  Created by TranTPhuong on 12/23/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import Foundation

struct Pokemon {
    var name: String
    var img: String
    
    init(name: String, img: String) {
        self.name = name
        self.img = img
    }
    
    init() {
        self.name = ""
        self.img = ""
    }
}
