//
//  SwiftLearning.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 26/09/21.
//

import UIKit

public class ThermometerClass {
  private(set) var temperature: Double = 0.0
  public func registerTemperature(_ temperature: Double) {
    self.temperature = temperature
  }
}


public struct ThermometerStruct {
  private(set) var temperature: Double = 0.0
  public mutating func registerTemperature(_ temperature: Double) {
    self.temperature = temperature
  }
}


class Address {
  var fullAddress: String
  var city: String
  
  init(fullAddress: String, city: String) {
    self.fullAddress = fullAddress
    self.city = city
  }
}

class Person {
  var name: String
  var address: Address
  
  init(name: String, address: Address) {
    self.name = name
    self.address = address
  }
}


class Author {
    var book: Book?
}

class Book {
    var numberOfPages = 100
}


class SwiftLearning {
    var text: String!
    /*
     Fallthrough is a keyword used in switch statement.If fallthrough exits in a sucessfull case it execute the next case irrespective of the case value match.
     **/
    
    //This complicated code sorts an array of names alphabetically. Simplify the closure as much as you can.
    func compilingHigherOrderFunc() {
        var animals = ["fish", "cat", "chicken", "dog"]
        animals.sort { (one: String, two: String) -> Bool in return one < two }
        animals.sort { (one, two) in return one < two }
        animals.sort { return $0 < $1 }
        animals.sort { $0 < $1 }
        animals.sort(by: <)
        print(animals)
    }
    
    func debuGAddress() {
        var headquarters = Address(fullAddress: "123 Tutorial Street", city: "Appletown")
        var ray = Person(name: "Ray", address: headquarters)
        var brian = Person(name: "Brian", address: headquarters)
        print(ray)
        print(brian)
        brian.address.fullAddress = "148 Tutorial Street"
        print(ray)
        
        let thermometerClass = ThermometerClass()
        thermometerClass.registerTemperature(56.0)
        /*The ThermometerStruct is correctly declared with a mutating function to change its internal variable temperature. The compiler complains because you've invoked registerTemperature on an instance created via let, which is therefore immutable. Change let to var to make the example compile.
         With structures, you must mark methods that change the internal state as mutating, but you cannot invoke them from immutable variables.
         */
        let thermometerStruct = ThermometerStruct()
        //thermometerStruct.registerTemperature(45.0)
    }
    
    func clouserPrint() {
        var thing = "cars"
        let closure = { [thing] in
          print("I love \(thing)")
        }
        thing = "airplanes"
        closure()
    }
    
    /*
     It'll print: I love cars. The capture list creates a copy of thing when you declare the closure. This means that captured value doesn't change even if you assign a new value to thing.*/
    
    /*
     If you omit the capture list in the closure, then the compiler uses a reference instead of a copy. Therefore, when you invoke the closure, it reflects any change to the variable. You can see this in the following code:*/
    
    func clouserPrint2() {
        var thing = "cars"
        let closure = {
          print("I love \(thing)")
        }
        thing = "airplanes"
        closure() // Prints: "I love airplanes"
    }
    
    func generic() {
        let equalInt = areBothEqual(x: 5, y: 6)
        let equalString = areBothEqual(x: "Hello", y: "Hello")
    }
    
    func areBothEqual<T: Equatable>(x: T, y: T) -> Bool{
        return x == y
    }
    
    func isStringEqual(x: String, y: String) -> Bool{
        return x == y
    }
    
    //implicitly unwrapped optionals ?
    func implicitlyUnwrappedOptional() {
        if let ty = text {
            print(ty)
        }
        
        print(text)
        text = "Hello"
        print(text)
        if let ty = text {
            print(ty)
        }
        let startIndex = text?.startIndex
        print(startIndex)
        
        if text == nil {
            print("Nil")
        }
    }
    
    func fallThrough() {
        var sum = 0
        let num = 6
        switch num {
        case 2:
            sum += num
            print(sum)
        case 4:
            sum += num
            print(sum)
        case 6:
            sum += num
            print(sum)
            fallthrough
        case 8:
            sum += num
            print(sum + 100)
        default:
            sum += 10
            print(sum)
        }

    }
    
    func clouserExample(myClouser: ()->(), second: String) {
        print("Clouser Testing, \(second)")
        myClouser()
    }
    
    //An autoclosure is a closure that's automatically created to wrap an expression that's being passed as an argument to a function. It doesn't take any arguments, and when it's called, it returns the value of the expression that's wrapped inside of it.
    func autoClouserExample(myClouser: @autoclosure ()->(), second: String) {
        print("Auto Clouser Testing, \(second)")
        myClouser()
    }
    
    func autoClouserReturnExample(myClouser: @autoclosure ()->(String), second: String) {
        print("Auto Clouser Testing, \(second)")
        let returnc = myClouser()
        print(returnc)
    }
    
    func callClouser() {
        clouserExample(myClouser: {
            print("Nice") },
                   second: "Hello")
        
        autoClouserExample(myClouser: (
            print("AutoClouser return")), second: "Hello")
        
        
        autoClouserReturnExample(myClouser: "caller return", second: "Hello")
        
        
    }
    
    
    
    /*
     It will execute at the end of each loop iteration.
     **/
    func deferExample() {
        for i in 1...10 {
            print ("In \(i)")
            defer { print ("Deferred \(i)") }
            print ("Out \(i)")
        }
    }
    
    func deferExample1() {
        print("1")
        defer {
            print("4")
            print("5")
        }
        defer {
            print("3")
        }
        print("2")
    }
    
    func deepCopy() {
        let s1 = School("School1")
        let s2 = School("School2")

        let list = [s1, s2]
        var list2 = list
        let clonedList = list.copy()
        
        var copiedArray = list.map{$0.copy()}
        print(copiedArray)
    }
}

class School {
    var name: String

    init(_ name: String) {
        self.name  = name
    }
}

extension Array where Element: NSCopying {
    func copy() -> [Element] {
        return self.map{$0.copy() as! Element}
    }
}

extension School: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return School(name)
    }
}
