//
//  EditGroupViewController.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/30.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import EZSwiftExtensions
import RxCocoa
import RxSwift
import RealmSwift

class EditGroupViewController: UIViewController {
    
    @IBOutlet weak var closeItem: UIBarButtonItem!
    
    @IBOutlet weak var editTextView: UITextView!
    
    var disposeBag = DisposeBag()
    
    var groupTitle: String!
    var groupID: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeItem.rx
            .tap
            .bindNext { [unowned self] in
                self.dismissVC(completion: nil)
            }
            .addDisposableTo(disposeBag)
        
        editTextView.rx
            .didChange
            .filter { [unowned self] () -> Bool in
                return self.editTextView.text.contains("\n")
            }
            .bindNext { [unowned self] in
                
                DispatchQueue.global().async {
                    let realm = try! Realm()
                    realm.beginWrite()
                    realm.create(GroupModel.self, value: ["groupID": self.groupID, "groupTitle": self.editTextView.text], update: true)
                    try! realm.commitWrite()
                }
                
            }
            .addDisposableTo(disposeBag)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        editTextView.text = groupTitle
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        Timer.runThisAfterDelay(seconds: 0.4, after: { [unowned self] _ in
            self.editTextView.becomeFirstResponder()
        })
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        editTextView.resignFirstResponder()
        
    }
    

}
