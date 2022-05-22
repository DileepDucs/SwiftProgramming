//
//  MemoryManagement.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 19/05/22.
//

import Foundation


class ARC {
    
    func retainCycle() {
        var blog: Blog? = Blog(name: "SwiftLee", url: URL(string: "www.avanderlee.com")!)
        var blogger: Blogger? = Blogger(name: "Antoine van der Lee")
        blog!.owner = blogger
        blogger!.blog = blog

        blog = nil
        blogger = nil

        // Nothing is printed
    }
    
}
