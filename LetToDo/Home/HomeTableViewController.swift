//
//  HomeTableViewController.swift
//  LetToDo
//
//  Created by xuemincai on 16/9/15.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources


class HomeTableViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    
    private var dataSource = RxTableViewSectionedReloadDataSource<HomeListSectionModel>()
    private var sections: [HomeListSectionModel] = [.AddToDoSection(item: [.AddToDo(placeholder: "Add what u want TODO...")]),
                                                    .DisplayToDoSection(item: [.DisplayToDo(title: "Running on the road, I will eat lots of")])]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.setStatusBarHidden(false, with: .slide)
        
        stupNavBarItem()
        
        configTableView()
        
    }

    
    /// 安装导航栏按钮
    private func stupNavBarItem() {
        
        // 左侧 Nav 按钮
        let barLeftBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "NavBarMuen"), style: .plain, target: nil, action: nil)
        barLeftBtn.tintColor = UIColor.white
        let barLeftSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barLeftSpace.width = -16
        self.navigationItem.leftBarButtonItems = [barLeftSpace, barLeftBtn]
        
        // 右侧 Nav 按钮
        let barRightBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "NavBarSetting"), style: .plain, target: nil, action: nil)
        barRightBtn.tintColor = UIColor.white
        let barRightSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barRightSpace.width = -16
        self.navigationItem.rightBarButtonItems = [barRightSpace, barRightBtn]
        
    }
    
    /// 配置 tableview
    private func configTableView() {
        
        
        skinTableViewDataSource(dataSource)
        Observable.just(sections)
            .bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
        
        
    }
    
    /// 解析数据源
    ///
    /// - parameter dataSource: 数据源
    private func skinTableViewDataSource(_ dataSource: RxTableViewSectionedReloadDataSource<HomeListSectionModel>) {
        
        dataSource.configureCell = { (dataSource, tableView, indexPath, item) in
            
            switch item {
            case let .AddToDo(placeholder: placeholder):
                let cell: AddToDoTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.selectionStyle = .none
                cell.inputText.placeholder = placeholder
                return cell
                
            case let .DisplayToDo(title: title) :
                let cell: DisplayToDoTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.selectionStyle = .none
                cell.cellTitle.text = title
                return cell
               
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

}

private extension UITableView {
    
}
