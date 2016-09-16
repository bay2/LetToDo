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

class AddToDoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var inputText: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 2
        bgView.layer.borderColor = UIColor(named: .borderColor).cgColor
        bgView.layer.borderWidth = 0.5
        
        inputText.setPlaceholderColor(UIColor(named: .addToDoPlaceholderColor))
        inputText.attributedPlaceholder = NSAttributedString(string: inputText.placeholder ?? "",
                                                             attributes: [NSForegroundColorAttributeName: UIColor(named: .addToDoPlaceholderColor),
                                                                          NSFontAttributeName: UIFont.italicSystemFont(ofSize: 14)]);
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
