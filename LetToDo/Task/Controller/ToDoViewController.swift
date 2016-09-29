//
//  ToDoViewController.swift
//  LetToDo
//
//  Created by xuemincai on 2016/9/25.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import RxRealm
import SnapKit
import MGSwipeTableCell

class ToDoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    
    private var dataSource = RxTableViewSectionedReloadDataSource<HomeListSectionModel>()
    private var sections: [HomeListSectionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
        self.tableView.rx.setDelegate(self).addDisposableTo(disposeBag)
        
        Observable.from(realm.objects(ToDoModel.self))
            .map { (results) -> [HomeListCellItem] in
                results.flatMap { (model: ToDoModel) -> HomeListCellItem in
                    .DisplayToDo(taskID: model.taskID, title: model.taskName, isDone: model.isDone)
                }
            }
            .map { (displayToDo) -> [HomeListSectionModel] in
                [.DisplayToDoSection(placeholder: "Add what u want TODO...", item: displayToDo)]
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
        // Dispose of any resources that can be recreated.
    }
    
}


//MARK: tableView 配置
extension ToDoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let view: AddToDoTableView = Bundle.loadNib("AddToDoTableView") else {
            return nil
        }
        
        return view
    }
    
}

//MARK: 动画效果的实现
extension ToDoViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let cell: DisplayToDoTableViewCell = self.tableView.cellForRow(index: self.tableView.contentOffsetToIndexPath()) else {
            return
        }
        
        self.tableView.setVisibleCellsAlpha1()
        cell.bgView.alpha = self.tableView.contentOffsetToCellAlpha()
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.adjustContentOffset()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if (!decelerate) {
            scrollView.adjustContentOffset()
        }
        
    }
    
}

fileprivate extension UIScrollView {
    
    /// 调整偏移量
    func adjustContentOffset() {
        
        let y = Int(self.contentOffset.y + 64)
        let index: Int = Int(y / 55)
        let addIndex = (y % 55) > 10 ? 1 : 0
        let offsetY = (index + addIndex) * 55 - 64
        
        self.setContentOffset(CGPoint(x: 0, y: offsetY), animated: true)
        
    }
    
}

fileprivate extension UITableView {
    
    
    
    /// 根据index 获取cell
    ///
    /// - parameter index: 获取index的回调
    ///
    /// - returns: cell
    func cellForRow<T: UITableViewCell>(index: @autoclosure () -> IndexPath) -> T? {
        
        return self.cellForRow(at: index()) as? T
        
    }
    
    
    /// 根据偏移量计算 IndexPath
    ///
    /// - returns: IndexPath
    func contentOffsetToIndexPath() -> IndexPath {
        
        let y = Int(self.contentOffset.y + 64)
        let index: Int = Int(y / 55)
        
        return IndexPath(row: index, section: 0)
    }
    
    
    
    /// 根据偏移量转Cell透明度
    ///
    /// - returns: 透明度
    func contentOffsetToCellAlpha() -> CGFloat {
        
        let y = Int(self.contentOffset.y + 64)
        let index: Int = Int(y / 55)
        
        let offsetY = (index + 1)  * 55
        
        let alpha = CGFloat(offsetY - y) / 55
        
        return alpha
        
    }
    
    /// 将可见的cell透明度设置为1
    func setVisibleCellsAlpha1() {
        
        let _ = self.visibleCells.map { (cell) -> UITableViewCell in
            guard let displayCell = cell as? DisplayToDoTableViewCell else {
                return cell
            }
            displayCell.bgView.alpha = 1
            return displayCell
        }
        
    }
    
}
