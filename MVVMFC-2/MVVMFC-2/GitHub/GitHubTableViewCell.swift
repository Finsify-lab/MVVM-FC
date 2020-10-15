//
//  GitHubTableViewCell.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/16/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class GitHubTableViewCell: UITableViewCell {

    @IBOutlet weak var txtName : UILabel!
    @IBOutlet weak var txtFullName : UILabel!
    @IBOutlet weak var txtStar : UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var viewModel = GitHubCellModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.dataClosure = { [weak self] name, txtFullName, star in
                self?.txtName.text = name
                self?.txtFullName.text = txtFullName
                self?.txtStar.text = String(star)
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
