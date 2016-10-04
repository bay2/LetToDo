//
//  HomeCollectionViewController.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/4.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import EZSwiftExtensions

private let reuseIdentifier = "HomeGroupCollectionViewCell"

class HomeCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
//    self.navigationController?.navigationBar.setBackgroundImage(), forBarPosition: .any, barMetrics: .Default)
        
        
        let backgroundImage = UIImage.imageWithColor(imageWithColor: UIColor(named: .navBarBackground), size: CGSize(width: ez.screenWidth, height: 64))
            
            
        self.navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .any, barMetrics: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(imageWithColor: UIColor(named: .navBarBackground), size: CGSize(width: ez.screenWidth, height: 1))
        self.navigationController?.navigationBar.isTranslucent = false
        
        

        // Register cell classes
        self.collectionView!.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView!.register(UINib(nibName: "HomeGroupCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HomeGroupCollectionReusableView")

        // Do any additional setup after loading the view.
        
//        self.collectionView!.collectionV
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HomeGroupCollectionReusableView", for: indexPath)
        
    }

}

// MARK: UICollectionViewDelegateFlowLayout
extension HomeCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print(CGSize(width: ez.screenWidth * 0.5, height: ez.screenWidth * 0.5 * 0.88))
        
        return CGSize(width: ez.screenWidth * 0.5, height: ez.screenWidth * 0.5 * 0.88)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: ez.screenWidth, height: 104)
        
    }
    
}
