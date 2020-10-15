//
//  MainCollectionViewCell.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/15/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    var viewModel = MainCellModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.closureData = { name , img, url in
            self.lblName.text = name
            self.img.image = UIImage(systemName: img)
        }
    }

}
