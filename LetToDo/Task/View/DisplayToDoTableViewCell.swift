//
//  DisplayToDoTableViewCell.swift
//  LetToDo
//
//  Created by xuemincai on 16/9/17.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import RxCocoa
import RxRealm
import RxSwift
import MGSwipeTableCell

class DisplayToDoTableViewCell: MGSwipeTableCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var cellTitle: UILabel!
    var taskID: String = ""
    
    var rightSwipeDelBtn = MGSwipeButton(title: "Delete", backgroundColor: UIColor.clear).then {
            $0.contentHorizontalAlignment = .center
            $0.contentVerticalAlignment = .center
            $0.setPadding(0)
            $0.setBackgroundImage(#imageLiteral(resourceName: "SwipeDelBtn"), for: .normal)
            $0.setTitleColor(UIColor.white, for: .normal)
            $0.frame = CGRect(x: 0, y: 0, w: 90, h: 50)
            $0.setEdgeInsets(UIEdgeInsets(top: 5, left: -5, bottom: 0, right: 0))
        }
    
    private var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.borderColor = UIColor(named: .borderColor).cgColor
        bgView.layer.borderWidth = 0.5
        bgView.setCornerRadius(radius: 2)
        
        configSwipeBtn()
        configDoneBtn()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bgView.alpha = 1
    }
    
    func configSwipeBtn() {
        
        rightSwipeDelBtn
            .rxSwipeTap
            .map { _ in
                realm.objects(ToDoModel.self).filter("taskID == '\(self.taskID)'")
            }
            .bindTo(realm.rx.delete())
            .addDisposableTo(disposeBag)
        
        self.rightButtons = [rightSwipeDelBtn];
        
    }
    
    func configDoneBtn() {
        
        doneBtn.rx
            .tap
            .map { [unowned self] in
                ToDoModel(taskID: self.taskID, taskName: self.cellTitle.text ?? "", isDone: !self.doneBtn.isSelected) }
            .throttle(100, scheduler: MainScheduler.instance)
            .bindTo(realm.rx.add(update: true))
            .addDisposableTo(disposeBag)
        
        doneBtn.rx
            .tap
            .shareReplay(1)
            .bindNext { [unowned self] in
                self.doneBtn.isSelected = !self.doneBtn.isSelected
            }
            .addDisposableTo(disposeBag)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
