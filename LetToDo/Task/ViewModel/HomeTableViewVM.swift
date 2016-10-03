//
//  HomeTableViewVM.swift
//  LetToDo
//
//  Created by xuemincai on 16/9/17.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation
import RxDataSources

enum TaskSectionType {
    case DisplayTaskInfo
}

/// section Model
struct TaskListSectionModel {
    
    var type: TaskSectionType
    
    /// section View
    var sectionView: UIView?
    
    /// Item
    var cellItem: [TaskListCellItem]
    
    init(type: TaskSectionType, cellItem: [TaskListCellItem]) {
        self.type = type
        self.cellItem = cellItem
    }

    
}

extension TaskListSectionModel: IdentifiableType, Equatable {
    
    typealias Identity = TaskSectionType
   
    var identity: TaskSectionType {
        return type
    }
    
    static func ==(lhs: TaskListSectionModel, rhs: TaskListSectionModel) -> Bool {
        return lhs.type == rhs.type
    }
    
}

extension TaskListSectionModel: AnimatableSectionModelType {
    
    typealias Item = TaskListCellItem
    
    var items: [TaskListCellItem] {
        return cellItem
    }
    
    init(original: TaskListSectionModel, items: [Item]) {
        
        self = original
        self.cellItem = items
        
    }
    
}

struct TaskListCellItem {
    var taskID: String
    var title: String
    var isDone: Bool
}

extension TaskListCellItem: IdentifiableType, Equatable {
    
    typealias Identity = String
    
    var identity: String {
        return taskID
    }
    
    static func ==(lhs: TaskListCellItem, rhs: TaskListCellItem) -> Bool {
        return lhs.taskID == rhs.taskID
    }
    
}

/// cell item
///
/// - AddToDo:     添加 TODO Cell
/// - DisplayToDo: 展示 TODO Cell
//enum HomeListCellItem {
//    case DisplayToDo(taskID: String, title: String, isDone: Bool)
//}


/// section Model
///
/// - AddToDoSection:     添加 TODO Section
/// - DisplayToDoSection: 展示 TODO Section
//enum HomeListSectionModel {
//    
//    case DisplayToDoSection(placeholder: String, item: [HomeListCellItem])
//    
//}

//extension HomeListSectionModel: SectionModelType {
//    
//    typealias Item = HomeListCellItem
//    
//    var items: [HomeListCellItem] {
//        
//        if case let .DisplayToDoSection(_, item: items) = self {
//            return items.map {$0}
//        }
//        
//        return []
//    }
//    
//    init(original: HomeListSectionModel, items: [Item]) {
//        
//        if case let .DisplayToDoSection(placeholder: placeholder, item: items) = original {
//            self = .DisplayToDoSection(placeholder: placeholder, item: items)
//        }
//        
//        self = .DisplayToDoSection(placeholder: "", item: [])
//    }
//    
//}
