//
//  GroupModel.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/31.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation
import RealmSwift
import RandomColor

class GroupModel: Object {
    
    
    /// ID
    dynamic var groupID = UUID().uuidString
    
    
    /// 标题颜色
    dynamic var titleColor = randomColor(hue: .random, luminosity: .bright).hexString
    
    
    /// 标题名
    dynamic var groupTitle: String = ""
    
    
    /// 任务数
    dynamic var taskNum = 0
    
    
    override static func primaryKey() -> String? {
        return "groupID"
    }
    

}

extension GroupModel {
    
    convenience init(title: String) {
        self.init()
        groupTitle = title;
    }
    
    
}
