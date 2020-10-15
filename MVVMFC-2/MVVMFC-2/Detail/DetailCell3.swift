//
//  DetailCell3.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/9/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class DetailCell3: UITableViewCell {


    @IBOutlet weak var lblDescription: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var viewModel = DetailCellViewModel()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.dataClosure = {[weak self] item, owner in
            self?.lblDescription.text = item.description!
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
