//
//  GitHubViewController.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/14/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class GitHubViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var viewModel : GitHubViewModelType!
    
    init() {
        super.init(nibName: GitHubViewController.identifier, bundle: nil)
    }
    
    init(viewModel: GitHubViewModelType) {
        super.init(nibName: GitHubViewController.identifier, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var searchBar = GitHubSearchBar(frame: CGRect.init(x: 0, y: 0, width: 414, height: 56))
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        
        setupTable()
        
        viewModel.requestClosure = { [weak self] istrue in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setupTable() {
        let nib = UINib(nibName: GitHubTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: GitHubTableViewCell.identifier)
        tableView.tableHeaderView = searchBar
        tableView.keyboardDismissMode = .onDrag
    }
}

extension GitHubViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GitHubTableViewCell.identifier) as! GitHubTableViewCell
        
        let items = viewModel.itemResults[indexPath.row]
        let name = items.name
        let fullName = items.full_name
        let star = items.stargazers_count
        
        cell.viewModel.setData(name: name!, fullName: fullName!, star: star!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.itemResults[indexPath.row]
        viewModel.selected(url: item.url!)
        searchBar .resignFirstResponder()
    }
    
}

extension GitHubViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text?.lowercased(), !text.replacingOccurrences(of: " ", with: "").isEmpty else {
            return
        }
        viewModel.getItem(key: text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text?.lowercased(), !text.replacingOccurrences(of: " ", with: "").isEmpty else {
            return
        }
        viewModel.getItem(key: text)
    }
    
}
