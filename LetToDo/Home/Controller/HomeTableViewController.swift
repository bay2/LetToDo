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
import RxRealm


class HomeTableViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    
    private var dataSource = RxTableViewSectionedReloadDataSource<HomeListSectionModel>()
    private var sections: [HomeListSectionModel] = []
    

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
        
        
        Observable.from(realm.objects(ToDoModel.self))
            .map { (results) -> [HomeListCellItem] in
                results.flatMap { (model: ToDoModel) -> HomeListCellItem in
                    .DisplayToDo(taskID: model.taskID, title: model.taskName, isDone: model.isDone)
                }
            }
            .map { (displayToDo) -> [HomeListSectionModel] in
                [.AddToDoSection(item: [.AddToDo(placeholder: "Add what u want TODO...")]),
                 .DisplayToDoSection(item: displayToDo)]
            }
            .bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
        
        skinTableViewDataSource(dataSource)
        
        
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
                cell.inputBtn.setTitle(placeholder, for: .normal)
                return cell
                
            case let .DisplayToDo(taskID: taskID, title: title, isDone: isDone) :
                let cell: DisplayToDoTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.selectionStyle = .none
                cell.cellTitle.text = title
                cell.doneBtn.isSelected = isDone
                cell.taskID = taskID
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

