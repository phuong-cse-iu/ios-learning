//
//  CurrentWeather.swift
//  Sunshine
//
//  Created by TranTPhuong on 12/12/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName:String!
    var _date:String!
    var _weatherType:String!
    var _currentTemp:Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
            return _currentTemp
        }
        return _currentTemp
    }
    
    func printData() {
        print(self.currentTemp)
        print(self.weatherType)
        print(self.cityName)

    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        let currentWeatherURl:URL = URL(string: current_weather_url)!
        Alamofire.request(currentWeatherURl).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTempInKev:Double = main["temp"] as? Double {
                        let currentTempInCel = Double(round(currentTempInKev - 273.15))
                        self._currentTemp = currentTempInCel
                        
                    }
                    
                }
                
                if let weatherArr = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weatherArr[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                    
                   
                }
                
                if let name = dict["name"] as? String {
                    self._cityName = name
                    
                }
                
                
            }
           
            self.printData()
            completed()
        }
        
    }
}
