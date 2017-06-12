//
//  CurrencyButton.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CurrencyButton: ViewDelegate {
	private let button: UIBarButtonItem
	private weak var viewController: UIViewController?
	private let transition: Transition
	
	// MARK: Init
	
	internal convenience init(transition: Transition) {
		self.init(
			button: UIBarButtonItem(
				title: "Currency",
				style: .plain,
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
		viewController.navigationItem.rightBarButtonItem = button
		button.target = self
		button.action = #selector(currency)
	}
	
	func viewDidDisappear(viewController: UIViewController, animated: Bool) {
		self.viewController = nil
	}
	
	@objc func currency() {
		transition.transition(parent: viewController!)
	}
}
