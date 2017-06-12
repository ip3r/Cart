//
//  CancelButton.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CancelButton: ViewDelegate {
	private let button: UIBarButtonItem
	private weak var viewController: UIViewController?
	private let transition: Transition
	
	// MARK: Init
	
	internal convenience init(transition: Transition) {
		self.init(
			button: UIBarButtonItem(
				barButtonSystemItem: .cancel,
				target: nil,
				action: nil
			),
			transition: transition
		)
	}
	
	internal required init(button: UIBarButtonItem, transition: Transition) {
		self.button = button
		self.transition = transition
	}
	
	// MARK: ViewDelegate
	
	func viewWillAppear(viewController: UIViewController, animated: Bool) {
		self.viewController = viewController
		viewController.navigationItem.leftBarButtonItem = button
		button.target = self
		button.action = #selector(cancel)
	}
	
	func viewDidDisappear(viewController: UIViewController, animated: Bool) {
		self.viewController = nil
	}
	
	@objc func cancel() {
		transition.transition(parent: viewController!)
	}
}
