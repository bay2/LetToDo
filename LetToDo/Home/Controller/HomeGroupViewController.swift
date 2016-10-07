//
//  HomeGroupViewController.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/7.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import EZSwiftExtensions

fileprivate let reuseIdentifier = "HomeGroupCollectionViewCell"
fileprivate let reusableViewIdentifier = "HomeGroupCollectionReusableView"

class HomeGroupViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        configNavigationBar()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// register Cell
    func registerCell() {
        
        self.collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView.register(UINib(nibName: reusableViewIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reusableViewIdentifier)
    }
    
    
    /// 配置 Nav Bar
    func configNavigationBar() {
        
        let backgroundImage = UIImage.imageWithColor(imageWithColor: UIColor(named: .navBarBackground), size: CGSize(width: ez.screenWidth, height: 64))
        
        self.navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .any, barMetrics: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(imageWithColor: UIColor(named: .navBarBackground), size: CGSize(width: ez.screenWidth, height: 1))
        self.navigationController?.navigationBar.isTranslucent = false
        
    }

}

extension HomeGroupViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reusableViewIdentifier, for: indexPath)
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension HomeGroupViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ez.screenWidth * 0.5, height: ez.screenWidth * 0.5 * 0.88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: ez.screenWidth, height: 104)
    }
    
}
