//
//  AddToDoTableView.swift
//  LetToDo
//
//  Created by xuemincai on 2016/9/24.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import RxSwift
import EZSwiftExtensions

class AddToDoTableView: UIView {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var inputBtn: UIButton!
    
    private var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.setCornerRadius(radius: 2)
        bgView.layer.borderColor = UIColor(named: .borderColor).cgColor
        bgView.layer.borderWidth = 0.5
        
        configInputText()
        
    }
    
    /// 配置输入框
    func configInputText() {
        
        inputBtn
            .rx
            .tap
            .bindNext {
                InputToDoView.showInputView()
            }
            .addDisposableTo(disposeBag)
        
    }

}

extension InputToDoView {
    
    
    /// 显示输入视图
    static func showInputView () {
        
        guard let inputView: InputToDoView = Bundle.loadNib("InputToDoView") else {
            return
        }
        
        inputView.frame.size = CGSize(width: ez.screenWidth, height: ez.screenHeight)
        inputView.inputTextView.isHidden = true
        inputView.alpha = 0
        UIApplication.shared.keyWindow?.addSubview(inputView)
        
        UIView.animate(withDuration: 0.5) {
            inputView.alpha = 1
            inputView.inputTextView.isHidden = false
        }
        
        
    }
    
}
