//
//  main.swift
//  SimpleCalc
//
//  Created by Jooneil Ahn on 10/7/15.
//  Copyright © 2015 Jooneil Ahn. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Double {
        return Double(NSNumberFormatter().numberFromString(incoming)!.integerValue)
}

print("Enter an expression seperated by returns:")

var inputs = [Double]()



var op = input()
var go = true
var value : Double = 0
repeat {
switch op {
    case ("+"):
        print("Result: \(inputs[0] + convert(input()))")
        go = false
    case ("-"):
        print("Result: \(inputs[0] - convert(input()))")
        go = false
    case ("x"):
        print("Result: \(inputs[0] * convert(input()))")
        go = false
    case ("/"):
        print("Result: \(inputs[0] / convert(input()))")
        go = false
    case ("%"):
        print("Result: \(inputs[0] % convert(input()))")
        go = false
    case ("count"):
        print("Result: \(inputs.count)")
        go = false
    case ("avg"):
        var sum : Double = 0
        for i in 1...inputs.count {
            sum += inputs[i - 1]
        }
        print("Result: \(sum / Double(inputs.count))")
        go = false
    case ("fact"):
        if inputs.count > 1 {
            print("Factorials only accept one number")
            exit(1)
        }
        var factSum : Double = inputs[0]
        for var j = (inputs[0] - 1); j > 0; j--  {
            factSum *= j
        }
        print("Result: \(factSum)")
        go = false
    default:
        inputs.append(convert(op))
        op = input()
}

} while go



