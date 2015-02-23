//
//  TextViewController.swift
//  Psychologist
//
//  Created by Richard E Millet on 2/22/15.
//  Copyright (c) 2015 remillet. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	//
	// My Code
	//
	override var preferredContentSize: CGSize {
		get {
			if textView != nil && presentingViewController != nil {
				return textView.sizeThatFits(presentingViewController!.view.bounds.size)
			}
			return super.preferredContentSize
		}
		set {
			super.preferredContentSize = newValue
		}
	}
	
	var text: String = "" {
		didSet {
			textView?.text = self.text
		}
	}

	@IBOutlet weak var textView: UITextView! {
		didSet {
			textView.text = self.text
		}
	}
	
}
