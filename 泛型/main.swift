//
//  main.swift
//  泛型
//
//  Created by 张德荣 on 15/9/28.
//  Copyright © 2015年 张德荣. All rights reserved.
//

import Foundation
/*
func swapTwoInts(inout a : Int, inout b: Int) {
     let temporaryA = a
     a = b
     b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)

print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(inout a : String, inout b : String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(inout a : Double,inout b : Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}
*/

/*
func swapTwoValues<T>(inout a: T, inout b : T) {
   let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, b: &anotherInt)


var sometString = "hello"
var anohterString = "world"
swapTwoValues(&sometString, b: &anohterString)


struct IntStack {
    var items = [Int]()
    mutating func push(item : Int) {
         items.append(item)
    }
    mutating func pop() ->Int {
        return items.removeLast()
    }
}

struct Stack<T> {
    var items = [T]()
     mutating func push(item : T) {
         items.append(item)
    }
    mutating func pop() -> T {
     return items.removeLast()
    }
}


var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTop = stackOfStrings.pop()
print(fromTheTop)

func findStringIndex(array: [String], valueToFind: String) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind  {
           return index
        }
    }
    return nil
}



func findIndex<T: Equatable>(array :[T],valueToFind :T) -> Int? {
    for(index,value) in array.enumerate() {
        if value == valueToFind {
        return index
        }
    }
    return nil
}

let doubleIndex = findIndex([3.14159,0.1,0.25], valueToFind: 9.3)

print(doubleIndex)

let stringIndex = findIndex(["Mike","Malcolm","Andrea"], valueToFind: "Andrea")


print(stringIndex!)

*/

protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count : Int {get}
    subscript(i: Int) -> ItemType {get}
}



struct IntStack: Container {
    var items = [Int]()
    mutating func push(item : Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
         return items.removeLast()
    }
//    typealias ItemType = Int
    mutating func append(item: Int) {
        self.push(item)
    }
    var count : Int {
     return items.count
    }
    subscript(i : Int) -> Int {
     return items[i]
    }
}


struct Stack<T>:Container {
    var items = [T]()
    mutating func push(item : T) {
         items.append(item)
    }
    mutating func pop() -> T {
         return items.removeLast()
    }
    mutating func append(item: T) {
        self.push(item)
    }
    var count : Int {
        return items.count
    }
    subscript(i : Int) ->T {
        
        return items[i]
    }
}

extension Array : Container {}

func allItemsMatch<C1 : Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType:Equatable>(someContainer: C1,anotherContainer:C2) -> Bool {
    print(someContainer.count)
    print(anotherContainer.count)
//    guard someContainer.count == anotherContainer.count else {
//         return false
//    }
    if someContainer.count != anotherContainer.count {
         return false
    }
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
           return false
        }
    }
 return true
}

var stackOfStrings = Stack<String>()

stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

var arrayOfStrings = ["uno","dos","tres"]

if allItemsMatch(stackOfStrings, anotherContainer: arrayOfStrings) {
      print("All items match.")
}
else
{
      print("Not all items match.")
}

