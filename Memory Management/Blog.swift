//
//  Blog.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 19/05/22.
//

import Foundation

class Blog {
    let name: String
    let url: URL
    weak var owner: Blogger?

    init(name: String, url: URL) { self.name = name; self.url = url }

    deinit {
        print("Blog \(name) is being deinitialized")
    }
}

class Blogger {
    let name: String
    var blog: Blog?

    init(name: String) { self.name = name }

    deinit {
        print("Blogger \(name) is being deinitialized")
    }
}

class NoteBook {
    var bookName: String
    
    init(bookName: String) {
        self.bookName = bookName
    }
    
    func printName() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print(self.bookName)
        }
    }
    
    deinit {
        print("Book deleted")
    }
}
