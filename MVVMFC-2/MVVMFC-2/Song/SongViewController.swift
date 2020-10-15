//
//  SongViewController.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/14/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class SongViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    var viewModel: SongViewModelType!
    
    
    init() {
        super.init(nibName: SongViewController.identifier, bundle: nil)
    }
    
    init(viewModel: SongViewModelType) {
        super.init(nibName: SongViewController.identifier, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        viewModel.closureRequest = {[weak self] track in
            DispatchQueue.main.async {
                self?.lblName.text = track.track_name
            }
        }
               viewModel.getSongData()
    }


}
