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
        
        inputText.configToDoInputStyle()
        inputText.becomeFirstResponder()
        
        configAddBtn()
        
    }
    
    deinit {
        print("deinit ----- InputToDoView");
    }
    
    /// 配置添加按钮
    func configAddBtn() {
        
        addBtn
            .rx
            .tap
            .filter { [unowned self] in self.inputText.text != "" }
            .map { [unowned self] in  ToDoModel(taskName: self.inputText.text ?? "") }
//            .bindNext { [unowned self] model in
//                
//                try! realm.write {
//                    realm.add(model)
//                }
////                realm.add(model, update: false)
//                self.inputText.text = ""
//                self.hiddenAnimate()
//                
////                DispatchQueue.global().async {
////                    let realm = try! Realm()
////                    
////                    realm.beginWrite()
////                    realm.create(ToDoModel.self, value: model, update: false)
////                    try! realm.commitWrite()
////                }
//                
//            }
            .bindTo(realm.rx.add())
            .addDisposableTo(disposeBag)
        
        
        addBtn
            .rx
            .tap
            .shareReplay(1)
            .filter { [unowned self] in self.inputText.text != "" }
            .bindNext { [unowned self ] _ in
                self.inputText.text = ""
                self.hiddenAnimate()
            }
            .addDisposableTo(disposeBag)
        
    }
    
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
