//
//  ToDoModel.swift
//  LetToDo
//
//  Created by xuemincai on 16/9/21.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation
import RealmSwift


class ToDoModel: Object {
    
    
    /// ID
    dynamic var taskID = NSUUID().uuidString
    
    
    /// 任务名
    dynamic var taskName = ""
    
    
    /// 已完成
    dynamic var isDone = false
    
    override static func primaryKey() -> String? {
        return "taskID"
    }
    
    
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}

extension ToDoModel {
    
    convenience init(taskName: String, isDone: Bool = false) {
        
        self.init()
        
        self.taskName = taskName
        self.isDone = isDone
        
    }
    
    convenience init(taskID: String, taskName: String, isDone: Bool) {
        self.init()
        
        self.taskID = taskID
        self.taskName = taskName
        self.isDone = isDone
        
    }
}
