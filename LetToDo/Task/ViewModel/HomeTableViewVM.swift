//
//  HomeTableViewVM.swift
//  LetToDo
//
//  Created by xuemincai on 16/9/17.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation
import RxDataSources

/// cell item
///
/// - AddToDo:     添加 TODO Cell
/// - DisplayToDo: 展示 TODO Cell
enum HomeListCellItem {
    case DisplayToDo(taskID: String, title: String, isDone: Bool)
}


/// section Model
///
/// - AddToDoSection:     添加 TODO Section
/// - DisplayToDoSection: 展示 TODO Section
enum HomeListSectionModel {
    
    case DisplayToDoSection(placeholder: String, item: [HomeListCellItem])
    
}

extension HomeListSectionModel: SectionModelType {
    
    typealias Item = HomeListCellItem
    
    var items: [HomeListCellItem] {
        
        if case let .DisplayToDoSection(_, item: items) = self {
            return items.map {$0}
        }
        
        return []
    }
    
    init(original: HomeListSectionModel, items: [Item]) {
        
        if case let .DisplayToDoSection(placeholder: placeholder, item: items) = original {
            self = .DisplayToDoSection(placeholder: placeholder, item: items)
        }
        
        self = .DisplayToDoSection(placeholder: "", item: [])
    }
    
}
