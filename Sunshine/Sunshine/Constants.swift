//
//  Constants.swift
//  Sunshine
//
//  Created by TranTPhuong on 12/12/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import Foundation

let base_url:String = "http://api.openweathermap.org/data/2.5/weather?"
let latitude:String = "lat="
let lontitude:String = "&lon="
let app_id:String = "&appid="
let api_key:String = "09a8c7a3852b44670db1cbc916ec1396"
let current_weather_url:String = "\(base_url)\(latitude)\(Location.sharedInstance.latitude!)\(lontitude)\(Location.sharedInstance.longtitude!)\(app_id)\(api_key)"
typealias DownloadComplete = () -> ()

let forecast_url = "http://api.openweathermap.org/data/2.5/forecast/daily?\(latitude)\(Location.sharedInstance.latitude!)\(lontitude)\(Location.sharedInstance.longtitude!)&cnt=10&mode=json&appid=09a8c7a3852b44670db1cbc916ec1396"

