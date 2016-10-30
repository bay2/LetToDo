//
//  AddGroupViewController.swift
//  LetToDo
//
//  Created by xuemincai on 2016/10/18.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit
import IBAnimatable

class AddGroupViewController: UIViewController {
    
    @IBOutlet weak var inputTextView: AnimatableTextView!

	override func viewDidLoad () {
		super.viewDidLoad ()
        
        configNavigationBar()
        
        inputTextView.becomeFirstResponder()


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
