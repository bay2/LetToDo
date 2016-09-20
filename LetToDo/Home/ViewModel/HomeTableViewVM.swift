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
    case AddToDo(placeholder: String)
    case DisplayToDo(title: String)
}


/// section Model
///
/// - AddToDoSection:     添加 TODO Section
/// - DisplayToDoSection: 展示 TODO Section
enum HomeListSectionModel {
    
    case AddToDoSection(item: [HomeListCellItem])
    case DisplayToDoSection(item: [HomeListCellItem])
    
}

extension HomeListSectionModel: SectionModelType {
    
    typealias Item = HomeListCellItem
    
    var items: [HomeListCellItem] {
        switch self {
        case .AddToDoSection(item: let items):
            return items.map {$0}
            
        case .DisplayToDoSection(item: let items):
            return items.map {$0}
        }
    }
    
    init(original: HomeListSectionModel, items: [Item]) {
        switch original {
        case .AddToDoSection(item: _):
            self = .AddToDoSection(item: items)
        case .DisplayToDoSection(item: _):
            self = .DisplayToDoSection(item: items)
        }
    }
    
}
