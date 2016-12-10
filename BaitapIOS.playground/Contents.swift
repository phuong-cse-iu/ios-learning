//: Playground - noun: a place where people can play

import UIKit

// Exercise 1
let dictOfChar:Dictionary<Int, String> = [1: "a",2: "b",3: "c",4: "d",5: "e",6: "f",7: "g",8: "h",9: "i",10: "j",11: "k",12: "l",13: "m",14: "n",15: "o",16: "p",17: "q",18: "r",19: "s",20: "t",21: "u",22: "v",23: "w",24: "x",25: "y",26 :"z",27: "0",28: "1",29: "2",30: "3",31: "4",32: "5",33: "6",34: "7", 35: "8",36: "9"]

dictOfChar.count
// random a number from 1 to 26
// random a string length
var lenOfString = Int(arc4random()) % dictOfChar.count
// initialize randString (random string)
var randString:String = ""
// from 0 to string length, append a character in dictionary with randomized index into randString
for i in 0...lenOfString {
    var index:Int = Int(arc4random()) % dictOfChar.count + 1
    randString.append(dictOfChar[index]!)
}
print(randString)


// Find specific day in week with the date given in advance (Exercise 2)

// Month table

// Day table
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

func findDayOfWeek(_ date: String) {
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
    print(dayTab[result]!)
}

findDayOfWeek("18/06/1995")

