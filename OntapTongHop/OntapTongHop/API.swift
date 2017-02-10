//
//  API.swift
//  OntapTongHop
//
//  Created by TranTPhuong on 1/9/17.
//  Copyright © 2017 Trunky Foundation. All rights reserved.
//

import Foundation


enum API:String {
    case getSong = "baitap.json"
    var fullLink:String {
        return "http://hidaacademy.com/" + self.rawValue
    }
}

enum HTTPMethod:String {
    case get = "GET"
    case post = "POST"
}
