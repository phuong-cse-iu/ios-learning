//
//  ViewController.swift
//  CalDateOfWeek
//
//  Created by TranTPhuong on 11/29/16.
//  Copyright © 2016 TranTPhuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var btnCal: UIButton!
    @IBOutlet weak var txtFieldDate: UITextField!
    
    @IBOutlet weak var lblDayOfWeek: UILabel!
    let dayTab:Dictionary<Int, String> = [
        0: "Sat",
        1: "Sun",
        2: "Mon",
        3: "Tue",
        4: "Wed",
        5: "Thu",
        6: "Fri",
        7: "Sat"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func findMonthInTab(_ month: String) -> Int {
        let monthInInt = Int(month)
        let monthTab:Dictionary<Int, Int> = [1: 0, 2: 3, 3: 3, 4: 6, 5: 1, 6: 4, 7: 6, 8: 2, 9: 5, 10: 0, 11: 3, 12: 5]
        return monthTab[monthInInt!]!
    }
    
    func findYearInCen(_ year: String) -> Int {
        // cast year into int
        let yearInInt = Int(year)
        if  (yearInInt! < 1699 && yearInInt! >= 1600) {
            return 0
        } else if yearInInt! <= 1799 && yearInInt! >= 1700 {
            return 5
        } else if yearInInt! <= 1899 && yearInInt! >= 1800 {
            return 3
        } else if yearInInt! <= 1999 && yearInInt! >= 1900 {
            return 1
        } else if yearInInt! >= 2000 {
            return 0
        }
        return 0
    }
    
    func findDayOfWeek(_ date: String) -> String{
        // Date parameter format: dd/mm/yy. So we need to split out these "/" characters
        // dateAfterSplit = ddmmyy
        let dateAfterSplit = date.components(separatedBy: "/")
        // Retrieve day from dateAfterSplit Array
        let day = dateAfterSplit[0]
        // Retrieve month
        let month = dateAfterSplit[1]
        // Retrieve year
        let year:String = dateAfterSplit[2]
        /* Year in full digit, such as 2014. So we need to split it into two substring 20 and 14, and take out the
         two last digit */
        let index = year.index((year.startIndex), offsetBy: 2)
        let lastTwoDigitOfYear = year.substring(from: index)
        
        let result = (Int(day)! + findMonthInTab(month) + Int(lastTwoDigitOfYear)! + (Int(lastTwoDigitOfYear)! / 4) + findYearInCen(year)) % 7
        // result is in [0..7], look up day table for corresponding day, then print it out
        return dayTab[result]!
    }


    @IBAction func btnPressed(_ sender: Any) {
        let date:String = txtFieldDate.text!
        let day:String = findDayOfWeek(date)
        lblDayOfWeek.isHidden = false
        lblDayOfWeek.text = day
    }
}

