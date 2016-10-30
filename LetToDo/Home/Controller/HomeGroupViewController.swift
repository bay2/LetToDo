//
//  HomeGroupViewController.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/7.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import EZSwiftExtensions
import IBAnimatable
import RxSwift
import SnapKit

fileprivate let reuseIdentifier = "HomeGroupCollectionViewCell"
fileprivate let reusableViewIdentifier = "HomeGroupCollectionReusableView"

class HomeGroupViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    lazy var addGroupView: AddGroupView = {
//        
//        guard let view: AddGroupView = Bundle.loadNib("AddGroupView") else {
//            return AddGroupView()
//        }
//        
//        return view
//        
//    }()

    
    private var disposeBag = DisposeBag()
    
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
