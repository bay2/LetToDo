//
//  GroupViewModel.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/31.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation
import RxDataSources
import EZSwiftExtensions
import RxSwift


struct GroupViewModel {
    
    let groupID: String
    let groupTitle: String
    let TitleColor: UIColor
    let taskNum: Int
    
}

struct GroupSectionViewModel {
    
    var sectionID: String
    
    var groups: [GroupViewModel]
    
}

extension GroupViewModel: IdentifiableType, Equatable {
    
    typealias Identity = String
    
    var identity: String {
        return groupID
    }
    
}

// equatable, this is needed to detect changes
func == (lhs: GroupViewModel, rhs: GroupViewModel) -> Bool {
    return lhs.groupID == rhs.groupID
}

extension GroupViewModel {
    
    init(model: GroupModel) {
        self.groupID = model.groupID
        self.groupTitle = model.groupTitle
        self.TitleColor = UIColor(hexString: model.titleColor)
        self.taskNum = model.taskNum
    }
    
}

extension GroupSectionViewModel: AnimatableSectionModelType {
    
    typealias Item = GroupViewModel
    
    typealias Identity = String
    
    var identity: String {
        return sectionID
    }
    
    var items: [GroupViewModel] {
        return groups
    }
    
    init(original: GroupSectionViewModel, items: [GroupSectionViewModel.Item]) {
        self = original
        self.groups = items
    }
    
}
