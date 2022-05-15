//
//  LinkedList.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 25/09/21.
//

import UIKit

class Node {
    var data: Int
    var next: Node?
    init(_ data: Int) {
        self.data = data
    }
}

class LinkedList {
    var head: Node?
    var isEmpty: Bool {
        return head == nil
    }
    
    func printListNode() {
        print("Total item in the list are:")
        var current = head
        while current != nil {
            print(current?.data ?? "")
            current = current?.next
        }
        print("***** End of printing *****")
    }
    
    func addTwoNumbers(_ l1: Node?, _ l2: Node?) -> Node? {
        var carray = 0
        var sum = 0
        var head: Node?
        var current: Node?
        var l1 = l1
        var l2 = l2
        
        while l1 != nil && l2 != nil {
            sum = carray + l1!.data + l2!.data
            carray = sum / 10
            let temp = Node(sum % 10)
            if (head == nil) {
                head = temp
                current = temp
            } else {
                current?.next = temp
                current = current?.next
            }
            l1 = l1?.next
            l2 = l2?.next
        }
        while l1 != nil {
            sum = carray + l1!.data
            current?.next = Node(sum % 10)
            carray = sum / 10
            l1 = l1?.next
        }
        
        while l2 != nil {
            sum = carray + l2!.data
            current?.next = Node(sum % 10)
            carray = sum / 10
            l2 = l2?.next
        }
        if carray > 0 {
            current?.next = Node(sum % 10)
        }
        return head
    }
    
    func isPalindrome(_ head: Node?) -> Bool {
        var current = head
        var reverse = reverseLinkedList(head)
        while current != nil {
            if current?.data != reverse?.data {
                return false
            }
            current = current?.next
            reverse = reverse?.next
        }
        return true
    }
    
    func reverseLinkedList(_ head: Node?) -> Node? {
        var current = head
        var prev: Node?
        while current != nil {
            let temp = current?.next
            current?.next = prev
            prev = current
            current = temp
        }
        return prev
    }
    
    func deleteDuplicates(_ head: Node?) -> Node? {
        var temp = head
        if temp == nil || temp?.next == nil {
            return head
        }
        while temp != nil {
            var p = temp?.next
            if let value = temp?.data {
                while value == p?.data {
                    p = p?.next
                }
            }
            temp?.next = p
            temp = temp?.next
        }
        return head
    }
    
    func reverseListWithoutRecursion() {
        var current = head
        var prev: Node?
        while current != nil {
            let temp = current?.next
            current?.next = prev
            prev = current
            current = temp
        }
        head = prev
    }
    
    func reverseList(_ head: Node?) -> Node? {
        if head == nil || head?.next == nil {
            return head
        }
        let newHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
    
    func reversingLinkedList(head: Node?) -> Node? {
        var max = 0
        var current = head
        while current != nil {
           current = current?.next
           max = max + 1
        }
        current = head
        var count = 0
        var temp = head
        while current?.next != nil {
            let node = reverseLinkedList(head: temp, count: count, max: max)
            current = node?.next
            temp = node?.next
            max = max - 1
            count = count + 1
        }
        return head
    }

    func reverseLinkedList(head: Node?, count: Int, max: Int) -> Node? {
        if head == nil || head?.next == nil || count == max {
            return head
        }
        let newHead = reverseLinkedList(head: head?.next, count: count + 1, max: max)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }

    
    func insertNode(_ value: Int) {
        if head == nil {
            head = Node(value)
        }else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = Node(value)
        }
    }
    
    
    //How will you find the middle element of a singly linked list without iterating the list more than once?
    
    func middleNodeOfList() -> Node? {
        var first = head
        var second = head
        while first != nil && first?.next != nil && second != nil && second?.next != nil && second?.next?.next != nil{
            first = first?.next
            second = second?.next?.next
        }
        return first
    }
    
    func mergeTwoLists(_ list1: Node?, _ list2: Node?) -> Node? {
        var list1 = list1
        var list2 = list2
        var headt: Node?
        while list1 != nil && list2 != nil {
            var temp = -1
            let data1 = list1?.data ?? 0
            let data2 = list2?.data ?? 0
            if data1 <= data2 {
                temp = data1
                list1 = list1?.next
            } else {
                temp = data2
                list2 = list2?.next
            }
            if headt == nil {
                headt = Node(temp)
            } else {
                var current = headt
                while current?.next != nil {
                    current = current?.next
                }
                current?.next = Node(temp)
            }
        }
        
        while list1 != nil {
            let temp = list1?.data ?? 0
            if headt == nil {
                headt = Node(temp)
            } else {
                var current = headt
                while current?.next != nil {
                    current = current?.next
                }
                current?.next = Node(temp)
            }
            list1 = list1?.next
        }
        
        while list2 != nil {
            let temp = list2?.data ?? 0
            if headt == nil {
                headt = Node(temp)
            } else {
                var current = headt
                while current?.next != nil {
                    current = current?.next
                }
                current?.next = Node(temp)
            }
            list2 = list2?.next
        }
        return headt
    }
    
    //Detect loop in a linked list
    /**
            1.check head or head next is nil or not if it is nil return no loop found
            2.there is only one node and node next is pointing to self while loop will be handle this case.
     */
    
    func detectLoop() -> Node? {
        var first = head
        var second = head
        if first == nil || first?.next == nil {
            return nil
        }
        while second != nil && second?.next != nil {
            first = first?.next
            second = second?.next?.next
            if first === second {
                return first
            }
        }
        return nil
    }
    
    // How will you remove a cycle from a linked list?
    
    func deleteNode(value: Int) {
        var temp = head
        var prev: Node?
        if temp != nil && temp?.data == value {
            head = temp?.next
            return
        }
        while temp != nil && temp?.data != value {
            prev = temp
            temp = temp?.next
        }
        // If key was not present in linked list
        if prev == nil {
            return
        }
        prev?.next = temp?.next
    }
    
    // Start index = 1
    func deleteNodeWithGiven(index: Int) {
        if head == nil {
            print("List is empty")
            return
        }else if index == 1 {
            head = head?.next
        }else {
            var count = 1
            var current = head
            var prev: Node?
            while current != nil && count < index {
                prev = current
                current = current?.next
                count = count + 1
            }
            if prev != nil && count == index {
                prev?.next = current?.next
            }
        }
    }
}
