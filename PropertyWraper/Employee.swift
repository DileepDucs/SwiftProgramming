//
//  Employee.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 22/05/22.
//

import Foundation

//https://www.youtube.com/watch?v=6kq1F8ST5Vc
/*
 A property wrapper is a generic structure that encapsulates read and write access to the property and adds
 additional behavior to it. We use it if we need to constrain the available property values, add extra logic
 to the read/write access, or add some additional methods.

 OR
 a property wrapper is essentially a type that wraps a given value in order to attach additional logic to it
 — and can be implemented using either a struct or a class by annotating it with the @propertyWrapper attribute.
 Besides that, the only real requirement is that each property wrapper type should contain a stored property
 called wrappedValue, which tells Swift which underlying value that’s being wrapped.
 */
extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

struct Employee {
    var name: String
    var email: String
    func validate() -> Bool{
        if name.isEmpty || email.isEmpty {
            return false
        }
        if email.isValidEmail() == false {
            return false
        }
        return true
    }
    
    func registerUser () {
        if validate() {
            debugPrint("Validate Succefully")
        }
    }
}

// TODO: property wrapper concept came here

@propertyWrapper
struct EmailPropertWraper {
    private var value: String
    var wrappedValue: String {
        get {
            return isValidEmail(value) ? value : String()
        }
        
        set {
            value = newValue
        }
    }
    
    init(_ email: String) {
        value = email
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct EmployeePW {
    var name: String
    
    @EmailPropertWraper var email: String
    
    func validate() -> Bool{
        if name.isEmpty || email.isEmpty {
            return false
        }
        if email.isValidEmail() == false {
            return false
        }
        return true
    }
    
    func registerUser () {
        if validate() {
            debugPrint("Validate Succefully")
        }
    }
}

class Run {
    
    func emailCheck() {
        let employee = Employee(name: "Dileep", email: "dileep.ducs@gmmail.com")
        employee.registerUser()
    }
    
    func emailCheckWithPropertWrapper() {
        let employee = EmployeePW(name: "Dileep", email: EmailPropertWraper("dileep.ducs@gmmail.com"))
        employee.registerUser()
    }
}





