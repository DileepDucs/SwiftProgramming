//
//  MaxHeap.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 19/02/22.
//

import UIKit


//https://www.geeksforgeeks.org/binary-heap/
/*Heap Data Structure

A Heap is a special Tree-based data structure in which the tree is a complete binary tree. Generally, Heaps can be of two types:
 
 It's works on complete binary tree

Max-Heap: In a Max-Heap the key present at the root node must be greatest among the keys present at all of it’s children. The same property must be recursively true for all sub-trees in that Binary Tree.
 
Min-Heap: In a Min-Heap the key present at the root node must be minimum among the keys present at all of it’s children. The same property must be recursively true for all sub-trees in that Binary Tree.
 
 Min Heap:

             10                      10
          /      \               /       \
        20        100          15         30
       /                      /  \        /  \
     30                     40    50    100   40
 
 Max Heap:

             100                      100
          /      \               /       \
        20        30          50         40
       /                      /  \        /  \
     10                     30    20    10   5
 
 A Binary Heap is a Binary Tree with following properties.
 1) It’s a complete tree (All levels are completely filled except possibly the last level and the last level has all keys as left as possible). This property of Binary Heap makes them suitable to be stored in an array.

 2) A Binary Heap is either Min Heap or Max Heap. In a Min Binary Heap, the key at root must be minimum among all keys present in Binary Heap. The same property must be recursively true for all nodes in Binary Tree. Max Binary Heap is similar to MinHeap.
 
 How is Binary Heap represented?
 A Binary Heap is a Complete Binary Tree. A binary heap is typically represented as an array.
*/

struct MaxHeap {
    
    var items: [Int] = []
    
    //Get Index
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    // Boolean Check
    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    // Return Item From Heap
    private func leftChild(_ index: Int) -> Int {
        return items[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index)]
    }
    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }
    
    /*
     If you’re aware of the way that a Stack works, peek(), pop(), & push() are the functions available (in general) for you to modify the Stack. A Heap utilizes similar public functions for a developer to access and modify the data stored inside: peek(), poll(), and add(). Let’s discuss each below:
     */
    
    /*
     peek()
     The function peek() returns the value of the parent node in the Heap. Depending on whether your Heap is a Min Heap or Max Heap, you’ll be getting back the minimum or maximum value. The Heap’s data is not modified. Add the following at the bottom of the MinHeap struct:

     */
    
    public func peek() -> Int {
        if items.count > 0 {
            return items[0]
        } else {
            fatalError()
        }
    }
    
    /*
     poll()
     The function poll() returns and removes the value of the parent node from the Heap. Then, private functions within the Heap are called which rearrange the values in the Heap so that the next smallest (or largest) value becomes the parent node at the top and all others fit in to the place they should. Behind the scenes, we’re setting the value of the first item to be the value of the last item in the heap, then removing the duplicate last item. We then “Heapify Down” to check that the value of the root node fits. If it doesn’t, we swap it until it fits. Then we verify that all other indices are in their proper place and swap them accordingly. The Heap’s data is modified. Add the following at the bottom of the MinHeap struct:
     */
    
    mutating public func poll() -> Int {
        if items.count != 0 {
            let item = items[0]
            items[0] = items[items.count - 1]
            //heapifyDown()
            items.removeLast()
            return item
        } else {
            fatalError()
        }
    }
    
    /*
     add()
     The function add() appends a new value to the end of the Heap (via the items array), then private functions are called which help determine where the new value should go in comparison with existing Heap values. We will call this “Heapifying Up” in the instance of a Min Heap. The Heap’s data is modified in this function as well. Add the following at the bottom of the MinHeap struct:
     */
    
    mutating public func add(_ item: Int) {
        items.append(item)
        //heapifyUp()
    }
    
    mutating private func swap(indexOne: Int, indexTwo: Int) {
      let temp = items[indexOne]
      items[indexOne] = items[indexTwo]
      items[indexTwo] = temp
    }
}
