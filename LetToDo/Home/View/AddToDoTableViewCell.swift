//
//  AddToDoTableViewCell.swift
//  LetToDo
//
//  Created by xuemincai on 16/9/16.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import EZSwiftExtensions


class AddToDoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var inputBtn: UIButton!
    
    private var disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 2
        bgView.layer.borderColor = UIColor(named: .borderColor).cgColor
        bgView.layer.borderWidth = 0.5
        
        configInputText()
        
    }
    
    
    /// 配置输入框
    func configInputText() {
        
        inputBtn
            .rx
            .tap
            .subscribe { _ in
                InputToDoView.showInputView()
            }
            .addDisposableTo(disposeBag)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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


