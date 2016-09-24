//
//  DisplayToDoTableViewCell.swift
//  LetToDo
//
//  Created by xuemincai on 16/9/17.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DisplayToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var cellTitle: UILabel!
    var taskID: String = ""
    
    private var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configDoneBtn()
        
    }
    
    func configDoneBtn() {
        
        doneBtn.rx
            .tap
            .map { ToDoModel(taskID: self.taskID, taskName: self.cellTitle.text ?? "", isDone: !self.doneBtn.isSelected) }
            .bindTo(realm.rx.add(true))
            .addDisposableTo(disposeBag)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
