//
//  WeatherCell.swift
//  Sunshine
//
//  Created by TranTPhuong on 12/16/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
 
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMaxTemp: UILabel!
    @IBOutlet weak var lblWeatherType: UILabel!
    @IBOutlet weak var lblMinTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        lblDate.text = forecast.dateOfWeek
        lblMaxTemp.text = "\(forecast.maxTemp)°C"
        lblMinTemp.text = "\(forecast.minTemp)°C"
        lblWeatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
    
}
