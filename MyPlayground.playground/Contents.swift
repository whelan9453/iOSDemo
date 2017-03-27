//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"
var newStr = str + "World"

for item in newStr.characters {
    print(item)
}


let newTypeStr = NSString(string: newStr)
NSString(string :newTypeStr.substring(from: 5)).substring(to: 1)

newTypeStr.substring(with: NSRange(location: 6, length: 3))

if newTypeStr.contains("Hello") {
    print("bang!!")
}

newTypeStr.components(separatedBy: "o")

newTypeStr.uppercased
newTypeStr.lowercased