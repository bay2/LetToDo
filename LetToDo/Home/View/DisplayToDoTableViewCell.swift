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

class DisplayToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var cellTitle: UILabel!
    var taskID: String = ""
    
    private var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.borderColor = UIColor(named: .borderColor).cgColor
        bgView.layer.borderWidth = 0.5
        bgView.setCornerRadius(radius: 2)
        
        configDoneBtn()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bgView.alpha = 1
    }
    
    func configDoneBtn() {
        
        doneBtn.rx
            .tap
            .map { ToDoModel(taskID: self.taskID, taskName: self.cellTitle.text ?? "", isDone: !self.doneBtn.isSelected) }
            .bindTo(realm.rx.add(update: true))
            .addDisposableTo(disposeBag)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
