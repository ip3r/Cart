//
//  AmountTitle.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class AmountTitle: ViewDelegate {
	private let amount: Amount
	private let currencies: Currencies
	
	// MARK: Init
    
    internal required init(amount: Amount, currencies: Currencies) {
        self.amount = amount
		self.currencies = currencies
    }
    
    // MARK: ViewDelegate
	
	func viewWillAppear(viewController: UIViewController, animated: Bool) {
		let total = amount.value * currencies.current.rate
		let code = currencies.current.sign.stringValue
		viewController.title = String(format: "%.2f %@", arguments: [total, code])
	}
}
