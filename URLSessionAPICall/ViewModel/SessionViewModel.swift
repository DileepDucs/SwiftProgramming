//
//  SessionViewModel.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 16/01/22.
//

import Foundation

protocol SessionViewModelDelegate {
    func loadDataSuccessfully()
    func loadDataFailure()
}

class SessionViewModel {
    var searchItems = [Search]()
    var delegate: SessionViewModelDelegate?
    func loadUrlSessionAPI() {
        searchItems.removeAll()
        guard let url = URL(string: "https://api.github.com/search/repositories?q=Dileep&page=1&per_page=30") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error fetching data from server\nERROR: \(String(describing: error))")
                self.delegate?.loadDataFailure()
                return
            }
            guard let jsonData = data else {
                print("Response Data is empty")
                self.delegate?.loadDataFailure()
                return
            }
            do {
                let userData = try JSONDecoder().decode(User.self, from: jsonData)
                self.searchItems = userData.items
                self.delegate?.loadDataSuccessfully()
            } catch {
                print("Error \(error)")
                self.delegate?.loadDataFailure()
            }
        }.resume()
    }
    
    var itemsCount: Int {
        return searchItems.count
    }
    
    func getSearchitem(index: Int) -> Search{
        return searchItems[index]
    }
}
