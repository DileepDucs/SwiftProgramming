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
        //treeDataStructure()
       // memoryManagement()
       // heigherOrderFunc()
        //closure()
        //frequentlyAskedQN()
        treeDataStructure()
    }
    
    func frequentlyAskedQN() {
        let qn = FrequentlyAskedQN()
        //qn.findLength([1,2,3,2,1], [8, 7, 6, 4, 7])
        //qn.findLengthOptimum([1,2,3,2,1], [3,2,1,4,7])
        qn.minSubArrayLen(4, [1, 4, 4])
    }
    
    func memoryManagement() {
        
        var bookObj: NoteBook?
        bookObj = NoteBook(bookName: "Objective C")
        bookObj?.printName()

        
        
        var blog: Blog? = Blog(name: "SwiftLee", url: URL(string: "www.avanderlee.com")!)
        var blogger: Blogger? = Blogger(name: "Antoine van der Lee")
        blog!.owner = blogger
        blogger!.blog = blog

        //blog = nil
        //blogger = nil

        // Nothing is printed
    }
    
    func  heigherOrderFunc() {
        let heigherOrder = HeigherOrderFunc()
        heigherOrder.map()
        heigherOrder.compactMap()
        heigherOrder.filter()
        heigherOrder.reduce()
    }
    
    func closure() {
        let clouser = ClosuresExample()
       // clouser.helpermakeSquareOf()
       // clouser.doSomething()
        clouser.doSomethingEscaping()
    }
    
    func treeDataStructure() {
        //TREE [1,2,2,2,null,2]
        let root = Tree(data: 20)
        let tree = TreeDataStructure()
        //let mirror = tree.isMirrorTree(root1: root, root2: root2)
        //print(mirror)
        root.left = Tree(data: 10)
        root.left?.left = Tree(data: 5)
        root.left?.right = Tree(data: 15)
        root.right = Tree(data: 30)
        root.right?.left = Tree(data: 25)
        root.right?.right = Tree(data: 35)
        //tree.preOrder(node: root)
        //tree.preOrderTraversal(root: root)
        tree.inOrder(node: root)
        let temp = tree.binaryTreeInsertion(root: root, data: 12)
        print("\n")
        tree.inorderTraversalIterative(root: temp)
           
           //tree.pathSum(root, 22)
           //tree.inorderTraversal(root)
           //tree.isSymmetric(root)
           
   //        let height = tree.height(root: root)
   //        let diameter = tree.diameter(root: root)
   //        print(diameter)
   //        let bst = tree.BST(root: root, key: 18)
   //        print(bst?.data ?? 0)
   //        root.right?.left = Tree(data: 25)
   //        root.right?.right = Tree(data: 35)
   //        root.right?.right?.left = Tree(data: 33)
   //        var stack = Stack<Int>()
   //        tree.sumOfNodeFromRootToLeaf(root: root, stack: &stack)
   //        var sum = 0
   //        tree.sumOfNodeFromRootToLeaf(root: root, sum: &sum)
       }
    
    @IBAction func memoryMButtonPressed(_ sender: UIButton) {
        pushDetailsViewController()
    }
    
    private func pushDetailsViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
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
