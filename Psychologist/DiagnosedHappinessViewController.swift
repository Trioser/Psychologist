//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Richard E Millet on 2/22/15.
//  Copyright (c) 2015 remillet. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {
	
	override var happiness: Int {
		didSet {
			self.diagnosticHistory.append(happiness)
		}
	}
	
	private let defaults = NSUserDefaults.standardUserDefaults()
	
	var diagnosticHistory: Array<Int> {
		get {
			return defaults.objectForKey(Constants.DIAG_HISTORY_DEFAULTS_KEY) as? Array<Int> ?? []
		}
		set {
			defaults.setObject(newValue, forKey: Constants.DIAG_HISTORY_DEFAULTS_KEY)
		}
	}
	
	private struct Constants {
		static let DIAG_HISTORY_DEFAULTS_KEY = "diagnosticHistoryKey"
	}
	
	private struct SegueIdendifier {
		static let SHOW_HISTORY = "showHistory"
	}
	
	func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
		return UIModalPresentationStyle.None
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let identifier = segue.identifier {
			switch identifier {
				case SegueIdendifier.SHOW_HISTORY:
					if let destinationViewController = segue.destinationViewController as? TextViewController {
						if let ppc = destinationViewController.popoverPresentationController {
							ppc.delegate = self
						}
						destinationViewController.text = "\(self.diagnosticHistory)"
					}
				default: break
			}
		}
	}
	
}
