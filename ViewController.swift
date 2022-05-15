//
//  ViewController.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 31/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let num = NumberProgramming()
        num.largestGoodInteger("6777133339")
    }

}

class MinStack {
    
    private var array = [Int]()
    init() {
        
    }
    
    func push(_ val: Int) {
        self.array.append(val)
    }
    
    func pop() {
        if array.count > 0 {
            self.array.removeLast()
        }
    }
    
    func top() -> Int {
        var result = -1
        if let value = array.last {
            result = value
        }
        return result
    }
    
}
