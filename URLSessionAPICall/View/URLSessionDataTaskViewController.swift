//
//  URLSessionDataTaskViewController.swift
//  SwiftProgramming
//
//  Created by Dileep Jaiswal on 16/01/22.
//

import UIKit

class URLSessionDataTaskViewController: UIViewController {
    
    @IBOutlet weak var searchTableView: UITableView!
    
    var viewModel: SessionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = self
        searchTableView.dataSource = self
        viewModel = SessionViewModel()
        viewModel?.delegate = self
        viewModel?.loadUrlSessionAPI()
    }
}

extension URLSessionDataTaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTViewCell
        let search = viewModel?.getSearchitem(index: indexPath.row)
        cell.loadCellContent(search: search)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension URLSessionDataTaskViewController: SessionViewModelDelegate {
    
    func loadDataSuccessfully() {
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
        
    }
    
    func loadDataFailure() {
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
}
