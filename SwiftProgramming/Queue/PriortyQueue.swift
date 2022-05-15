//
//  PriortyQueue.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 17/02/22.
//

import UIKit
/*
 //https://www.geeksforgeeks.org/priority-queue-set-1-introduction/
 //https://prepinsta.com/c-program/priority-queue-using-arrays/
 Priority Queue is an abstract data type, which is similar to a queue. I
 In the priority queue, every element has some priority.
 The priority of the elements in a priority queue determines the order in which elements are removed from the priority queue.
 All the elements are either arranged in an ascending or descending order.
 */

// Types of Priority Queue:
/*
 Ascending Order:
 Descending order:
 */

/*
 Types of Priority Queue:
 Min Priority Queue: Minimum number of value gets the highest priority and lowest number of element gets the highest priority.
 Max Priority Queue: Maximum number value gets the highest priority and minimum number of value gets the minimum priority.
 */

struct Item {
    var value: Int
    var priority: Int
}

// It's really Awesome PriortyQueue with Array
//This is implemeted for the Max Priority Queue: (We can implement Min Priority Queue with same logic)
//Maximum number value gets the highest priority and minimum number of value gets the minimum priority.
struct PriortyQueue {
    var array = [Item]()
    
    // enqueue just adds item to the end of the priority queue | O(1)
    mutating func enqueue(value: Int, priorty: Int) {
        let item = Item(value: value, priority: priorty)
        array.append(item)
    }
    
    // returns index with highest priority
    // NOTE: Max Priority Queue High priority number means higher priority | O(N)
    func peak() -> Int {
        var index = -1
        var max = Int.min
        for (i, item) in array.enumerated() {
            // If two items have same priority choose the one with higher data value
            if max == item.priority && index > -1 && array[index].value < array[i].value {
                max = item.priority
                index = i
            }
            // note: using MAX Priority so higher priority number
            // means higher priority
            else if max < item.priority {
                max = item.priority
                index = i
            }
        }
        return index
    }
    
    mutating func dequeue() {
        // Get element with highest priority
        let index = peak()
        
        // reduce size of priority queue by first
        // shifting all elements one position left
        // from index where the highest priority item was found
        for i in index..<array.count - 1 {
            array[i] = array[i + 1]
        }
        // reduce last item from priority
        if array.count > 0 {
            array.removeLast()
        }
    }
    
    func display() {
        for item in array {
            print("value: \(item.value), Priority: \(item.priority)");
        }
    }
    
    mutating func printToDisplay() {
        enqueue(value: 5, priorty: 1)
        enqueue(value: 20, priorty: 3)
        enqueue(value: 15, priorty: 4)
        enqueue(value: 10, priorty: 3)
        enqueue(value: 500, priorty: 2)
        print("Before Dequeue :");
        display()
        
        // Dequeue the top element
        dequeue()
        print("\nAfter 1st Dequeue :")
        display()
        
        dequeue()
        print("\nAfter 2nd Dequeue :")
        display()
        
    }
    
}
