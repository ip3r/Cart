//
//  CartViewController.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CartViewController: ViewController {

	// MARK: Init
	
	internal convenience init(cartItems: CartItems, products: Products, currencies: Currencies) {
		self.init(
            tableView: Memory<UITableView?>(value: nil),
			cartItems: cartItems,
			products: products,
			currencies: currencies
		)
	}
	
	internal required init(tableView: Memory<UITableView?>, cartItems: CartItems, products: Products, currencies: Currencies) {
		let button = UIBarButtonItem(
			title: "Checkout",
			style: .plain,
			target: nil,
			action: nil
		)
		super.init(
			title: ConstString("Cart"),
			delegate: ViewDelegates(
				delegates: [
					TableView(
						tableView: tableView,
						dataSource: CartTableItems(
							items: cartItems,
							button: button
						),
						delegate: CartTableItems(
							items: cartItems,
							button: button
						),
						editing: true
					),
					AddButton(
						transition: ModalTransition(viewController: { () -> (UIViewController) in
							return UINavigationController(
								rootViewController: ProductsViewController(
									cartItems: cartItems,
									products: products
								)
							)
						})
					),
                    CheckoutButton(
                        button: button,
                        transition: PushTransition(viewController: { () -> (UIViewController) in
                            return CheckoutViewController(
                                items: cartItems,
                                currencies: currencies
                            )
                        }),
                        items: cartItems
                    )
				]
			)
		)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
