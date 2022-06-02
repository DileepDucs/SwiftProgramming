//
//  SecondViewController.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 20/05/22.
//

import UIKit
//https://www.youtube.com/watch?v=rESIHtfYN_Y ////goood
//In troducing a retain cycle by using a clouser or NSNotifiacationcenter
//https://medium.com/@mohitchaudhary_43770/why-we-should-use-weak-self-in-closure-d21b22193884
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ///setuPNotification()
        networkManager()
    }
    
    func setuPNotification() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("Hello"), object: nil, queue: .main) { [unowned self] notification in
            print("NotificationCenter callback")
            self.holdMemoryObject()
        }
    }
    
    func holdMemoryObject() {
        print("OK")
    }
    
    //What if [weak self]
    //What if [unowned self]
    //What if remove
    
    func networkManager() {
        NetworkManager.shared.callAPI { [weak self] value in
            self?.holdMemoryObject()
        }
    }
    
    deinit {
        print("deallocated SecondViewController sucesfully")
    }
}

class NetworkManager {
    static var shared = NetworkManager()
    
    func callAPI(sucess: @escaping(Int?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            sucess(nil)
        }
    }
}
