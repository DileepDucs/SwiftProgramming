//
//  Queue.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 17/02/22.
//

import UIKit

struct Queue<T> {
    
    private var array = [T]()
    
    mutating func enqueue(_ item: T) {
        array.append(item)
    }
    
    mutating func dequeue() -> T? {
        guard let first = array.first else { return nil }
        array.removeFirst()
        return first
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var peak: T? {
        array.first
    }
    
}
