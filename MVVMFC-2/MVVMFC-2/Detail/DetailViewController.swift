//
//  DetailViewController.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var viewModel: DetailViewModelType!

    
    init() {
        super.init(nibName: DetailViewController.identifier, bundle: nil)
    }
    
    init(viewModel: DetailViewModelType) {
        super.init(nibName: DetailViewController.identifier, bundle: nil)
        self.viewModel = viewModel
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: DetailCell1.identifier, bundle: nil)
        let nib2 = UINib.init(nibName: DetailCell2.identifier, bundle: nil)
        let nib3 = UINib.init(nibName: DetailCell3.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DetailCell1.identifier)
        tableView.register(nib2, forCellReuseIdentifier: DetailCell2.identifier)
        tableView.register(nib3, forCellReuseIdentifier: DetailCell3.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.getItem()
       
        
        viewModel.requestClosure = { [weak self] istrue in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.itemResults
        let owner = viewModel.ownerResults
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell1.identifier) as! DetailCell1
            cell.viewModel.getData(item: item, owner: owner)
            viewModel.getImage()
            viewModel.imageClosure = { data in
                cell.viewModel.getImage(data: data)
            }
            
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell2.identifier) as! DetailCell2
            cell.viewModel.getData(item: item, owner: owner)
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell3.identifier) as! DetailCell3
            cell.viewModel.getData(item: item, owner: owner)
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
