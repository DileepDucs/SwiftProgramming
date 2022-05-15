//
//  FrequentlyAskedQN.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 14/01/22.
//

import Foundation

class FrequentlyAskedQN {
    
    // LinkedList Problems
    func linkedListProblems() {
        let linkedList = LinkedList()
        var head = Node(1)
        //
        linkedList.reverseListWithoutRecursion()
        
        //
        linkedList.reverseList(head)
        
        //How to traverse to the middle of a linked list?
        
        // Implement the process of reversing a linked list.
        
        
    }
    
    func stringProgramming() {
        //How can you reverse a string?
        var string = "GAABBAAG"
        var reverseString = ""
        for value in string.enumerated() {
            reverseString = String(value.element) + reverseString
        }
        print(reverseString)
        
        //What is a palindrome string? //palindrome string is the one which on reversing remains the same
        
        
        //How to get the matching characters in a string?
        
        //How to get the non-matching characters in a string?
        
        //How to calculate the number of vowels and consonants in a string?
        
        //prove that the two strings are anagrams?
        
        //Find the count for the occurrence of a particular character in a string.
        
        //How to verify if two strings are a rotation mutually?
        
        //How to calculate the number of numerical digits in a string?
        
        //How to compute the first character of a string that is not repeated?
        
        //How to perform swapping two strings by not using a third variable?
        
        //How to remove special characters in a string that is in lowercase?
    }
    
    func numberProgramming() {
        //Compute the first five Fibonacci numbers.
        
        //Determine the factors of a number.
        
        //How to search a missing number in an array that contains integers from 1 to 100?
        
        //How to get the matching elements in an integer array?
        
        //How to delete the repeated elements in an integer array?
        
        //Determine the largest and the smallest element of an array which is not sorted.
        
        // Determine the second largest element of an array.
        
        //Explain the reversal of an array.
        
        //How to verify if a number is prime or not?
        
        //How to reverse a number?
    }
}


