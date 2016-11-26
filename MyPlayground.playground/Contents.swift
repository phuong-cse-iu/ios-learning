//: Playground - noun: a place where people can play

import UIKit

//let a:String = ""
//var b:String = ""

let arr:[Int] = [1, 2, 3]

for (index, val) in arr.enumerated() {
    
}

// cu phap duyet mang nhanh
arr.map{print($0)}

//let arr:Array<Int> = [1,2,3]
// array 2d
let arr2D:[[Int]] = [[1,2,3], [4,5, 6], [7, 8, 9]]


let arrDict:Array<Dictionary<String, String>> = [["hl": "hello"], ["a": "apple"], ["b": "Bear"]]

arrDict[0]["hl"]

let dictArrB:Dictionary<String, Array<Int>> = ["ar":[1,2,3], "b": [2,3,4]]

dictArrB["ar"]?[0] // co gia tri tai 0 hay khong, neu nil thi bo qua

// phan biet cham hoi va cham than
// nil = null
// khong the gan nil
//var c:String = nil
var c:String? = nil // ? co the la String co the la nil

// loi print(c!)
// nil thi dang sau cham hoi se bo qua

var a:String = "1"
var b:Int = 1

b = Int(a)!
a = String(a)



arc4random()


let arrInt:Array<Int> = [1,2,3,4,5,6]
arc4random() % UInt32(arrInt.count)// random
arrInt.count

arrInt

// Random mot chuoi ki tu bat ki
// tim ngay thu may trong tuan
// tim cach random


// Exercise 1
let dictOfAlp:Dictionary<Int, String> = [1: "a",2: "b",3: "c",4: "d",5: "e",6: "f",7: "g",8: "h",9: "i",10: "j",11: "k",12: "l",13: "m",14: "n",15: "o",16: "p",17: "q",18: "r",19: "s",20: "t",21: "u",22: "v",23: "w",24: "x",25: "y",26 :"z",27: "0",28: "1",29: "2",30: "3",31: "4",32: "5",33: "6",34: "7", 35: "8",36: "9"]

dictOfAlp.count
// random a number from 1 to 26
// random a string length
var lenOfString = Int(arc4random()) % dictOfAlp.count
// initialize randString (random string)
var randString:String = ""
// from 0 to string length, append a character in dictionary with randomized index into randString
for i in 0...lenOfString {
    var index:Int = Int(arc4random()) % dictOfAlp.count + 1
    randString.append(dictOfAlp[index]!)
}
print(randString)


// Find specific day in week with the date given in advance


