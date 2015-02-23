//
//  ViewController.swift
//  Psychologist
//
//  Created by Richard E Millet on 2/22/15.
//  Copyright (c) 2015 remillet. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	//
	// My code
	//
	@IBAction func nothingAction(sender: UIButton) {
		performSegueWithIdentifier("showNothing", sender: sender)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		//
		// If our destination is a UINavigationController, get it's first visible view controller
		//
		var destinationViewController = segue.destinationViewController as? UIViewController
		if let navigationController = destinationViewController as? UINavigationController {
			destinationViewController = navigationController.visibleViewController
		}
		//
		// If our destination is a happiness controller, prepare it for the segue
		//
		if let happinessViewControl = destinationViewController as? HappinessViewController {
			if let identifier = segue.identifier {
				switch identifier {
					case "showSadDiag": happinessViewControl.happiness = 0
					case "showHappyDiag": happinessViewControl.happiness = 100
					case "showMehDiag": happinessViewControl.happiness = 50
					case "showNothing": happinessViewControl.happiness = 55
					default: happinessViewControl.happiness = 50
				}
			}
		} else {
			println("WARNING! Could not segue to HappinessViewController.")
		}
	}

}

