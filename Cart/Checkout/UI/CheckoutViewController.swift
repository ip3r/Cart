//
//  CheckoutViewController.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CheckoutViewController: ViewController {
	
	// MARK: Init
	
	internal convenience init(items: CartItems, currencies: Currencies) {
		self.init(
            tableView: Memory<UITableView?>(value: nil),
			items: items,
			currencies: currencies
		)
	}
	
	internal required init(tableView: Memory<UITableView?>, items: CartItems, currencies: Currencies) {
		super.init(
			title: ConstString("Checkout"),
			delegate: ViewDelegates(
				delegates: [
					TableView(
						tableView: tableView,
						dataSource: CheckoutTableItems(
							items: items,
							currencies: currencies
						),
						delegate: CheckoutTableItems(
							items: items,
							currencies: currencies
						)
					),
					AmountTitle(
						amount: TotalCartAmount(
							cartItems: items
						),
						currencies: currencies
					),
					CurrencyButton(
						transition: ModalTransition(
							viewController: { () -> (UIViewController) in
								return UINavigationController(
									rootViewController: CurrenciesViewController(
										currencies: currencies
									)
								)
							}
						)
					)
				]
			)
		)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
