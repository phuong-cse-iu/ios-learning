//
//  ViewController.swift
//  FoodStation
//
//  Created by TranTPhuong on 12/26/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var restaurantNames = ["Noir", "Trois Gourmands", "Trois Gourmands", "Bep Me In", "Ichiba Sushi Vietnam", "Sushi REI", "Sorae Restaurant - Lounge", "The Refinery", "Une Journee a Paris", "La Cuisine", "Le Comptoir de Saigon", "La Brasserie", "Saffron", "Portofino Italian Restaurant", "Ciao Bella", "Jaspas Restaurant", "Crystal Jade", "Ocean Palace", "Yu Chu", "Ngan Dinh Restaurant", "Hum Vegetarian, Lounge & Restaurant", "Ngọc Châu Garden"]
    
    var imgArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22",]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print(restaurantNames.count)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: imgArr[indexPath.row])
        return cell
    }

    


}

