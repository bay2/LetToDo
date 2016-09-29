//
//  InputToDoView.swift
//  LetToDo
//
//  Created by xuemincai on 2016/9/23.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift

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
            .bindNext { [unowned self] _ in
                self.hiddenAnimate()
            }
            .addDisposableTo(disposeBag)
        
        self.addGestureRecognizer(tap)
        
        
        configAddBtn()
        configInputText()
        
    }
    
    deinit {
        print("deinit ----- InputToDoView");
    }
    
    
    /// 配置输入框
    func configInputText() {
    
        inputText.configToDoInputStyle()
        inputText.becomeFirstResponder()
        
    }
    
    /// 配置添加按钮
    func configAddBtn() {
        
        let inputTextObservable = inputText.rx.controlEvent(.editingDidEndOnExit)
        let addBtnObservable =  addBtn.rx.tap
        
        
        Observable.of(inputTextObservable, addBtnObservable)
            .merge()
            .filter{ [unowned self] in self.inputText.text != "" }
            .map { [unowned self] in  ToDoModel(taskName: self.inputText.text ?? "") }
            .bindNext { [unowned self] (model) in
                self.inputText.text = ""
                self.hiddenAnimate()
                
                DispatchQueue.global().async {
                    let realm = try! Realm()
                    realm.beginWrite()
                    realm.add(model)
                    try! realm.commitWrite()
                }
                
            }
            .addDisposableTo(disposeBag)

        
    }
    
    
    /// 隐藏动画
    private func hiddenAnimate () {
        
        UIView.animate(withDuration: 0.5, animations: { [unowned self ] in
            
            self.alpha = 0
            self.inputTextView.isHidden = false
            
            }, completion: { [unowned self ] (isCompletion) in
                if (isCompletion) {
                    self.removeFromSuperview()
                }
            })
    }

}
