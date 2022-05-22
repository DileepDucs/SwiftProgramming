//
//  TreeTraversal.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 31/08/21.
//

import Foundation

class Tree {
   var data: Int
   var left: Tree?
   var right: Tree?
   init(data: Int) {
      self.data = data
   }
}

class TreeDataStructure {
    
    //9. How do you traverse a given binary tree in preorder without recursion?
    func preOrderTraversalIterative(root: Tree?) {
        guard let root = root else { return }
        var stack = Stack<Tree>()
        stack.push(root)
        while !stack.isEmpty {
            let top = stack.pop()
            print(top?.data ?? 0)
            if let right = top?.right {
                stack.push(right)
            }
            if let left = top?.left {
                stack.push(left)
            }
        }
    }
    
    //10. How do you print all nodes of a given binary tree using inorder traversal without recursion?
    
    func inorderTraversalIterative(root: Tree?) {
        guard let root = root else { return }
        var stack = Stack<Tree>()
        var current: Tree? = root
        while current != nil || stack.isEmpty == false{
            while current != nil {
                stack.push(current!)
                current = current?.left
            }
            current = stack.pop()
            print(current?.data ?? "")
            current = current?.right
        }
    }
    
    
    
    //Symmetric Tree (Mirror Image of itself)
    /**
          1
        /       \
       2          2
      /   \        /   \
     3    4      4    3
     
     */
    
    // Sum of all node in binary tree
    func addBT(root: Tree?) -> Int {
        guard let root = root else { return 0 }
        return root.data + addBT(root: root.left) + addBT(root: root.right)
    }
    
    // check given node is leaf or not
    
    func isLeaf(root: Tree?) -> Bool {
        guard let root = root else { return false }
        if root.left == nil && root.right == nil {
            return true
        }
        return false
    }
    
    //Sum of nodes on the longest path from root to leaf node
    
    
    
    
    func BST(root: Tree?, key: Int) -> Tree? {
        if root == nil || root?.data == key {
            return root
        }
        if let root = root, root.data < key {
            return BST(root: root.right, key: key)
        }
        return BST(root: root?.left, key: key)
    }
    
    func diameter(root: Tree?) -> Int {
        guard let root = root else { return 0 }
        let lHeight = height(root: root.left)
        let rHeight = height(root: root.right)
        let leftDiameter = diameter(root: root.left)
        let rightDiameter = diameter(root: root.right)
        return max(lHeight + rHeight + 1, max(leftDiameter, rightDiameter))
    }
    
    func height(root: Tree?) -> Int {
        guard let root = root else { return 0 }
        return 1 + max(height(root: root.left), height(root: root.right))
    }
    
    func max(_ a: Int, _ b: Int) -> Int {
        return a > b ? a : b
    }
    
    func minDepth(root: Tree?) -> Int {
        guard let root = root else { return 0 }
        if (root.left == nil && root.right == nil) {
            return 1
        }
        var l = Int.max, r = Int.max
        if root.left != nil {
            l = minDepth(root: root.left)
        }
        
        if root.right != nil {
            r = minDepth(root: root.right)
        }
        return min(l, r) + 1
    }
    
    func min(_ a: Int, _ b: Int) -> Int {
        return a < b ? a : b
    }
    
    
    func isMirrorTree(root1: Tree?, root2: Tree?) -> Bool {
        if root1 == nil && root2 == nil {
            return true
        }
        if root1 != nil && root2 != nil && root1?.data == root2?.data {
            return isMirrorTree(root1: root1?.left, root2: root2?.right) && isMirrorTree(root1: root1?.right, root2: root2?.left)
        }
        return false
    }
    
    //  Sum of all the node tree from root to leaf node
    /// 1st Approacsh using stack
    func sumOfNodeFromRootToLeaf(root: Tree?, stack: inout Stack<Int>) {
        // Base case
        guard let node = root else { return }
        stack.push(node.data)
        sumOfNodeFromRootToLeaf(root: node.left, stack: &stack)
        sumOfNodeFromRootToLeaf(root: node.right, stack: &stack)
        if node.left == nil && node.right == nil {
            print(stack.valuesSum)
        }
        stack.pop()
    }
    
    // using extra variable sum in parameter
    func sumOfNodeFromRootToLeaf(root: Tree?, sum: inout Int) {
        // Base case
        guard let node = root else { return }
        sum = sum + node.data
        sumOfNodeFromRootToLeaf(root: node.left, sum: &sum)
        sumOfNodeFromRootToLeaf(root: node.right, sum: &sum)
        if node.left == nil && node.right == nil {
            print(sum)
        }
        sum = sum - node.data
    }
    
    func pathsFromRootWithASpecifiedSum(root: Tree?, sum: inout Int, totalSum: Int) {
        // Base case
        guard let node = root else { return }
        sum = sum + node.data
        sumOfNodeFromRootToLeaf(root: node.left, sum: &sum)
        sumOfNodeFromRootToLeaf(root: node.right, sum: &sum)
        if node.left == nil && node.right == nil {
            print(sum)
        }
        sum = sum - node.data
    }
    
    // Tree Traversal
    
    func inOrder(node: Tree?) {
        guard let node = node else { return }
        inOrder(node: node.left)
        print(node.data)
        inOrder(node: node.right)
    }
    func preOrder(node: Tree?) {
        guard let node = node else { return }
        print(node.data)
        preOrder(node: node.left)
        preOrder(node: node.right)
    }
    func postOrder(node: Tree?) {
        guard let node = node else { return }
        postOrder(node: node.left)
        postOrder(node: node.right)
        print(node.data)
    }
    
    func inorderTraversal(node: Tree?) {
         var stack = Stack<Tree>()
         var current = node
         while current != nil || stack.isEmpty == false {
             while current != nil {
                stack.push(current!)
                current = current?.left
             }
             current = stack.pop()
             guard let currentNode = current else { return }
             print(currentNode.data)
             current = currentNode.right
        }
    }
    
    func morisTraversal(node: Tree?) {
        var current = node
        var pre: Tree? = nil
        while current != nil {
             if current?.left == nil {
                 if let currentNode = current {
                    print(currentNode.data)
                    current = currentNode.right
                 }
            } else {
                 pre = current?.left
                 while (pre?.right != nil) && (pre?.right !== current) {
                      pre = pre?.right
                 }
                 if pre?.right == nil {
                      pre?.right = current
                      current = current?.left
                 } else {
                      pre?.right = nil
                      print(current!.data)
                      current = current?.right
                 }
            }
        }
    }
    
    func inorderTraversal(_ root: Tree?) -> [Int] {
        var array = [Int]()
        helperInorderTraversal(root, array: &array)
        return array
    }
    
    func helperInorderTraversal(_ root: Tree?, array: inout [Int]) {
        guard let root = root else { return }
        helperInorderTraversal(root.left, array: &array)
        array.append(root.data)
        helperInorderTraversal(root.right, array: &array)
    }
    func isSameTree(_ p: Tree?, _ q: Tree?) -> Bool {
        if p == nil && q == nil { return true }
        if p?.data != q?.data { return false}
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    
    //https://www.geeksforgeeks.org/check-symmetric-binary-tree-iterative-approach/
    //Check for Symmetric Binary Tree (Iterative Approach)
    
    func isSymmetric(_ root: Tree?) -> Bool {
        guard let root = root else { return true }
        if root.left == nil && root.right == nil {
            return true
        }
        var queue = Queue<Tree>()
        queue.enqueue(root)
        queue.enqueue(root)
        while !queue.isEmpty {
            let left = queue.dequeue()
            let right = queue.dequeue()
            if left?.data != right?.data {
                return false
            }
            if left?.left != nil && right?.right != nil {
                queue.enqueue((left?.left)!)
                queue.enqueue((right?.right)!)
            } else if left?.left != nil || right?.right != nil {
                return false
            }
            
            if left?.right != nil && right?.left != nil {
                queue.enqueue((left?.right)!)
                queue.enqueue((right?.left)!)
            } else if left?.right != nil || right?.left != nil {
                return false
            }
        }
        return true
    }
    
    func hasPathSum(_ root: Tree?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false}
        if root.left == nil && root.right == nil {
            return targetSum == root.data
        }
        let sumLess = targetSum - root.data
        return hasPathSum(root.left, sumLess) || hasPathSum(root.right, sumLess)
    }
    
}
