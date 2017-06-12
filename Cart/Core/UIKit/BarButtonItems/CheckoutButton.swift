//
//  CheckoutButton.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CheckoutButton: ViewDelegate {
	private let button: UIBarButtonItem
	private weak var viewController: UIViewController?
	private let transition: Transition
	private let items: CartItems
	
	// MARK: Init
	
	internal convenience init(transition: Transition, items: CartItems) {
		self.init(
			button: UIBarButtonItem(
				title: "Checkout",
				style: .plain,
				target: nil,
				action: nil
			),
			transition: transition,
			items: items
		)
	}
	
	internal required init(button: UIBarButtonItem, transition: Transition, items: CartItems) {
		self.button = button
		self.transition = transition
		self.items = items
	}
	
	// MARK: ViewDelegate
	
	func viewWillAppear(viewController: UIViewController, animated: Bool) {
		self.viewController = viewController
		viewController.navigationItem.rightBarButtonItem = button
		button.target = self
		button.action = #selector(checkout)
		if items.count == 0 {
			button.isEnabled = false
		}
		else {
			button.isEnabled = true
		}
	}
	
	func viewDidDisappear(viewController: UIViewController, animated: Bool) {
		self.viewController = nil
	}
	
	@objc func checkout() {
		transition.transition(parent: viewController!)
	}
}
