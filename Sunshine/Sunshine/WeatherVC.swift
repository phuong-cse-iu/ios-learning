//
//  WeatherVC.swift
//  Sunshine
//
//  Created by TranTPhuong on 12/12/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire


class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCurrentTemp: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var imgCurrentWeather: UIImageView!
    @IBOutlet weak var lblCurrentWeatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLoc: CLLocation!
    
    var currentWeather:CurrentWeather!
    var forecasts = [Forecast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // when just app start, ask request to use gps service
        locationManager.requestWhenInUseAuthorization()
        // keep track gps signal change
        locationManager.startMonitoringSignificantLocationChanges()
        
        currentWeather = CurrentWeather()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.locationAuthStatus()
    }
    func locationAuthStatus() {
        // already authorized. Ready to download location
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLoc = locationManager.location
            Location.sharedInstance.latitude = currentLoc.coordinate.latitude
            Location.sharedInstance.longtitude = currentLoc.coordinate.longitude
            currentWeather.downloadWeatherDetails {
                
                self.downloadForecast {
                    self.updateUI()
                    print(forecast_url)
                }
                
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    func downloadForecast(completed: @escaping DownloadComplete) {
        Alamofire.request(forecast_url).responseJSON { response in
            
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                        
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
           completed()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
            cell.configureCell(forecast: forecasts[indexPath.row])
            return cell
        } else {
            return WeatherCell()
        }
        
    }
    
    
    
    
    
    func updateUI() {
        
        lblDate.text = currentWeather.date
        lblLocation.text = currentWeather.cityName
        lblCurrentWeatherType.text = currentWeather.weatherType
        lblCurrentTemp.text = "\(currentWeather.currentTemp)°C"
        imgCurrentWeather.image = UIImage(named: currentWeather.weatherType)
        
        
    }

    
}

