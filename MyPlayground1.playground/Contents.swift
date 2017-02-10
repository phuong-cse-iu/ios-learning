//: Playground - noun: a place where people can play

import UIKit

var str = "a b c"
let arrStr = str.components(separatedBy: " ")
var str2:String = ""
for word in arrStr {
    str2 += word
}

print(str2)

