//
//  Location.swift
//  Sunshine
//
//  Created by TranTPhuong on 12/16/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longtitude: Double!
}
