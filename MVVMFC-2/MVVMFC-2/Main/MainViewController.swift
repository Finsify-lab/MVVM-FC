//
//  MainViewController.swift
//  MVVMFC-2
//
//  Created by Lê Hoàng Sinh on 9/14/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var viewModel: MainViewModelType!

    static var identifier: String {
        return String(describing: self)
    }
    
    let fileName = "item" // tên file json để lấy dữ liệu
    @IBOutlet weak var collectionView: UICollectionView!

    
    init() {
        super.init(nibName: MainViewController.identifier, bundle: nil)
    }
    
    init(viewModel: MainViewModelType) {
        super.init(nibName:  MainViewController.identifier, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nib = UINib(nibName: MainCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        
        setupCollection()
        
        // khi nào request dữ liệu thành công thì reload CollectionView
        viewModel.itemClosure = { [weak self] success in
            self?.collectionView.reloadData()
        }
        
        viewModel.getData(fileName: fileName)
        
    }
    
    func setupCollection() {
        let screenWidth = UIScreen.main.bounds.width - 10
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout() // phải cấu hình layout cho CollectionView
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: (screenWidth/3)*5/4)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        collectionView.collectionViewLayout = layout
    }
}

extension MainViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemsResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
        
        let item = viewModel.itemsResult[indexPath.row]
        
        let name = item.name
        let img = item.image
        let url = item.url
        
        // truyền dữ liệu cho cell để hiển thị
        cell.viewModel.getData(name: name, img: img, url: url)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //select cell
        viewModel.selected(position: indexPath.row)
    }
    
    
    
}
