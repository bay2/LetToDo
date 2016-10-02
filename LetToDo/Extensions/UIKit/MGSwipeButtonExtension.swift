//
//  MGSwipeButtonExtension.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/1.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import Foundation
import MGSwipeTableCell
import RxCocoa
import RxSwift


extension MGSwipeButton {

    var rxSwipeTap: Observable<MGSwipeButton> {
        
        return Observable.create({ (observable) -> Disposable in
            
            self.callback = { button in
                observable.onNext(self)
                return true
            }
            
            return Disposables.create {
            }
        })
        
    }
    
    
}
