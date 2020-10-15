//
//  DetailCell1.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/9/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class DetailCell1: UITableViewCell {

   
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
   
    static var identifier: String {
        return String(describing: self)
    }
    
    var viewModel = DetailCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.dataClosure = {[weak self] item,owner in
            self?.lblName.text = item.name!
            self?.lblFullName.text = item.full_name!
            
        }
        viewModel.imageClosure = { [weak self] data in
            DispatchQueue.main.async {
                self?.avatar?.image = UIImage(data: data)
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
