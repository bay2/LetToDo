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
import RxDataSources

fileprivate let reuseIdentifier = "HomeGroupCollectionViewCell"
fileprivate let reusableViewIdentifier = "HomeGroupCollectionReusableView"

class HomeGroupViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var dataSources = RxCollectionViewSectionedAnimatedDataSource<GroupSectionViewModel>()
    
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        configNavigationBar()
        
        dataSources.configureCell = {(data, collectionView, indexPath, item) in
            
            let cell: HomeGroupCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            cell.groupTitle.text = item.groupTitle
            cell.groupTitle.textColor = item.TitleColor
            cell.itemLab.text = "Item \(item.taskNum)"
            cell.groupID = item.groupID
            
            return cell
            
        }
        
        dataSources.supplementaryViewFactory = { (data, collectionView, kind, indexPath) in
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reusableViewIdentifier, for: indexPath)
        }
        
        
        
        Observable.from(realm.objects(GroupModel.self))
            .map { (results) -> [GroupViewModel] in
                
                results.flatMap { model -> GroupViewModel in
                    GroupViewModel(model: model)
                }
     
            }
            .map { (items) -> [GroupSectionViewModel] in
                [GroupSectionViewModel(sectionID: "", groups: items)]
            }
            .bindTo(collectionView.rx.items(dataSource: dataSources))
            .addDisposableTo(disposeBag)
        
        collectionView
            .rx
            .setDelegate(self)
            .addDisposableTo(disposeBag)
        
        
        
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


// MARK: UICollectionViewDelegateFlowLayout
extension HomeGroupViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ez.screenWidth * 0.5, height: ez.screenWidth * 0.5 * 0.88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: ez.screenWidth, height: 104)
    }
    
}


