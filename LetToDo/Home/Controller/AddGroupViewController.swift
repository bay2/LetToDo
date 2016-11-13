//
//  AddGroupViewController.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/18.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import IBAnimatable
import RxSwift
import RxCocoa
import RxRealm
import RealmSwift

class AddGroupViewController: UIViewController {
    
    @IBOutlet weak var inputTextView: AnimatableTextView!
    @IBOutlet weak var addBtnItem: UIBarButtonItem!
    fileprivate var disposeBag = DisposeBag()

	override func viewDidLoad () {
		super.viewDidLoad ()
        
        configNavigationBar()
        inputTextView.becomeFirstResponder()
        
        // MARK: 添加组
        do {
            
            let inputTextViewReturn = inputTextView.rx.didChange.filter { () -> Bool in
                print(self.inputTextView.text)
                return (self.inputTextView.text.contains("\n") && self.inputTextView.text.length > 1)
            }
            
            let addBtnItemTap = addBtnItem.rx.tap.filter { [unowned self] _ in
                return !self.inputTextView.text.isEmpty
            }
            
            Observable.of(addBtnItemTap, inputTextViewReturn)
                .merge()
                .map { [unowned self] in
                    return GroupModel(title: self.inputTextView.text)
                }
                .bindNext { [unowned self] model in
                    
                    self.dismiss(animated: true, completion: nil)
                    
                    DispatchQueue.global().async {
                        
                        let realm = try! Realm()
                        realm.beginWrite()
                        realm.add(model)
                        try! realm.commitWrite()
                        
                    }
                    
                }
                .addDisposableTo(disposeBag)
                        
        }
        
	}

	override func didReceiveMemoryWarning () {
		super.didReceiveMemoryWarning ()
		// Dispose of any resources that can be recreated.
	}


	/*
	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
	}
	*/

}
