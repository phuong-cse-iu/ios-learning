//: Playground - noun: a place where people can play

import UIKit

var str = "a b c"

let arrStr = str.components(separatedBy: " ")
//var str2:String = ""
//for word in arrStr {
//    str2 += word
//}

var arrInt:Array<Int> = [1, 2, 3, 4]
let arrInt2 = arrInt.map{$0 * 2}
arrInt2

let arrInt3 = arrInt.filter{$0 == 3}
arrInt3

let arrStr2 = 
arrStr2