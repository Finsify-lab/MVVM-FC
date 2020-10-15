//
//  DetailCell2.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/9/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class DetailCell2: UITableViewCell {

   
    @IBOutlet weak var lblFork: UILabel!
    @IBOutlet weak var lblWatch: UILabel!
    @IBOutlet weak var lblStar: UILabel!
    
    
    static var identifier: String {
        return String(describing: self)
    }
    var viewModel = DetailCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.dataClosure = {[weak self] item,owner in
            self?.lblStar.text = String(item.stargazers_count!)
            self?.lblWatch.text = String(item.watchers_count!)
            self?.lblFork.text = String(item.forks_count!)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
