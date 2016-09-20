//
//  DisplayToDoTableViewCell.swift
//  LetToDo
//
//  Created by xuemincai on 16/9/17.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit

class DisplayToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var cellTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
