//
//  Forecast.swift
//  Sunshine
//
//  Created by TranTPhuong on 12/16/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class Forecast {
    var _dateOfWeek: String!
    var _minTemp:Double!
    var _maxTemp:Double!
    var _weatherType:String!
  
    
    var dateOfWeek: String {
        if _dateOfWeek == nil {
            _dateOfWeek = ""
        }
        return _dateOfWeek
    }
    
    var minTemp: Double {
        if _minTemp == nil {
            _minTemp = 0.0
        }
        return _minTemp
    }
    
    var maxTemp: Double {
        if _maxTemp == nil {
            _maxTemp = 0.0
        }
        return _maxTemp
    }
    
   
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let min = temp["min"] as? Double {
                let minTempInCel = Double(round(min - 273.15))
                self._minTemp = minTempInCel
            }
            
            if let max = temp["max"] as? Double {
                let maxTempInCell = Double(round(max - 273.15))
                self._maxTemp = maxTempInCell

            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
            
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._dateOfWeek = unixConvertedDate.convertDayOfWeekToString()
        }
        
    }
    
}

extension Date {
    func convertDayOfWeekToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
