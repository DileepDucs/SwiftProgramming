//
//  ClosuresExample.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 22/05/22.
//

import Foundation


/*
 -In Swift, a closure is a special type of function without the function name. For example
 Closures are self-contained blocks of functionality that can be passed around and used in your code.
 -
*/

class ClosuresExample {
    func example() {
        
        //syntax to declare a closures
        /*
        1-
        {
          print("Hello World")
        }
        
         2-
        { (parameters) -> returnType in
           // statements
        }
         */
        
        //3- we have defined a closure and assigned it to the variable named greet
        var greet = {
            print("Hello, World!")
        }
        
        // call the closure
        greet()
        
        
        //Closure Parameters: a closure can also accept parameters.
        let greetUser = { (name: String)  in
            print("Hey there, \(name).")
        }

        // closure call
        greetUser("Delilah")
        
        
        // Closure take no parameter and return nothing
        let sayHello: () -> Void = {
            print("Hello")
        }

        sayHello()
        
        // Closure That Returns Value
        
        // closure definition
        var findSquare = { (num: Int) -> Int in
          var square = num * num
          return square
        }
        
        // closure call
        var result = findSquare(3)

        print("Square:",result)
        
        let value: (Int) -> Int = { (value1) in
            return value1
        }
        
        print(value(5))
        
        let add: (Int, Int) -> Int = { (a, b) in
            return a + b
            
        }
        
        print(add(5, 87))
        
        let add2 = { (a: Int, b: Int) -> Int in
            return a + b
        }
        
        print(add2(2, 7))
        
        
        let addValues: (Int, Int) -> String = { (a , b) -> String in
            return "Sum is \(a + b)"
        }
        
        print(addValues(3, 4))
        
        // pass closure as a parameter
        grabLunch(search: {
           print("Alfredo's Pizza: 2 miles away")
        })
        
        /* OutPut: Let's go out for food
           Alfredo's Pizza: 2 miles away
         */
        
        grabLunch(message: "Let's go out for lunch", search: {
            print("Alfredo's Pizza: 2 miles away")
        })
        
        /*OutPut:-
         Let's go out for lunch
         Alfredo's Pizza: 2 miles away
         */
    }
    
    
    
    func grabLunch(search: () -> ()) {
        print("Let's go out for lunch")

          // closure call
          search()
    }
    
    func grabLunch(message: String, search: () -> ()) {
        print(message)

          // closure call
          search()
    }
    
    //TODO: Autoclosure
    //An autoclosure is a closure that’s automatically created to wrap an expression that’s being passed as an argument
    //to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s
    //wrapped inside of it.
    
    //While calling a function, we can also pass the closure without using the braces {}
    /*
     using {}
     display(greet:{
       print("Hello World!")
     }

     without using {}
     display(greet: print("Hello World!"))
     
     */
    
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
        autoClouserExample(myClouser: ( print("AutoClouser return") ), second: "Hello")
        autoClouserReturnExample(myClouser: "Caller Return", second: "Hello")
    }
    
    func display(greet: @autoclosure() -> ()){
        greet()
    }
    
    func greetCallerHelper() {
        display(greet: print("Hello Dileep"))
    }
    
    let digitSquare: (Int) -> Int = { (a) in
        return a * a
    }
    
    //TODO: Shorthand Argument Names
    
    let digitSquaredd: (Int) -> Int = {
        return $0 * $0
    }
    
    
    // TODO: Implicit Returns from Closure:
    //Single-expression closures can implicitly return the result of their single expression by omitting the return keyword from their declaration.
    let squareArea: (Int) -> Int = { $0 * $0 }
    let rectangleArea: (Int, Int) -> Int = { $0 * $1 }
    
    
    //TODO: Trailing Closure:
    
    /*
     If you need to pass a closure expression to a function as the function’s last argument and closure expression is too long,
     it can be written as trailing closure. A trailing closure is written after the function call’s parentheses (), even though
     it is still an argument to the function. When you use the trailing closure syntax, you don’t write the argument label for
     the closure as part of the function call.
     */
    
    func makeSquareOf(digit: Int, onCompletion: (Int) -> Void) {
        let squareDigit = digit * digit
        onCompletion(squareDigit)
    }
    
    func helpermakeSquareOf() {
        makeSquareOf(digit: 3) { square in
            print("Square of 9 is \(square)")
        }
        
        makeSquareOf(digit: 3, onCompletion: { square in
            print("Square of P 9 is \(square)")
        })
    }
    
    //TODO: Non-escaping Closures:
    //closure parameters are non-escaping by default, if you wanna escape the closure execution, you have to
    //use @escaping with the closure parameters.
    /*
     Lifecycle of the @nonescaping closure:
     1. Pass the closure as function argument, during the function call.
     2. Do some additional work with function.
     3. Function runs the closure.
     4. Function returns the compiler back.*/
    
    func getSumOf(array: [Int], handler: (Int) -> Void) {
        var sum: Int = 0
        for value in array {
            sum += value
        }
        handler(sum)
    }
    
    func doSomething() {
        print("Step 1")
        getSumOf(array: [1, 2, 3 ,4, 5], handler: { a in
            print(a)
        })
        print("Last Step")
    }
    
    
    // TODO: @escaping closures:
    /*
     Lifecycle of the @escaping closure:
     1. Pass the closure as function argument, during the function call.
     2. Do some additional work in function.
     3. Function execute the closure asynchronously or stored.
     4. Function returns the compiler back.
     */
    
    func getSumOf(items: [Int], handler: @escaping(Int) -> Void) {
        print("Step 2")
        var sum: Int = 0
        for value in items {
            sum += value
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            print("Step 3")
            handler(sum)
        }
    }
    
    func doSomethingEscaping() {
        print("Step 1")
        getSumOf(items: [1, 2, 3, 4, 50]) { [weak self] (sum) in
            print("Total sum = \(sum)")
        }
        print("Last Step completed")
    }
}
