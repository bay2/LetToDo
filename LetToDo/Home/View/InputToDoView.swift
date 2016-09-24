//
//  InputToDoView.swift
//  LetToDo
//
//  Created by xuemincai on 2016/9/23.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import RxSwift

class InputToDoView: UIView {

    @IBOutlet private weak var inputText: UITextField!
    @IBOutlet private weak var addBtn: UIButton!
    @IBOutlet weak var inputTextView: UIView!
    
    private var disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer()
        tap.rx
            .event
            .bindNext { _ in
                self.removeFromSuperview()
            }
            .addDisposableTo(disposeBag)
        
        self.addGestureRecognizer(tap)
        
        inputText.configToDoInputStyle()
        inputText.becomeFirstResponder()
        
        configAddBtn()
        
    }
    
    
    
    /// 配置添加按钮
    func configAddBtn() {
        
        addBtn
            .rx
            .tap
            .filter { self.inputText.text != "" }
            .map { ToDoModel(taskName: self.inputText.text ?? "") }
            .bindTo(realm.rx.add())
            .addDisposableTo(disposeBag)
        
        addBtn
            .rx
            .tap
            .shareReplay(1)
            .filter { self.inputText.text != "" }
            .bindNext { _ in
                self.inputText.text = ""
                self.removeFromSuperview()
            }
            .addDisposableTo(disposeBag)
        
    }

}
