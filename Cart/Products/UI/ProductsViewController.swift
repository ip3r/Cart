//
//  ProductsViewController.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class ProductsViewController: ViewController {

	// MARK: Init
	
	internal required init(cartItems: CartItems, products: Products) {
		let closing = ClosingTableDelegate()
		let items = ProductsTableData(
			products: products,
			cartItems: cartItems,
			origin: closing
		)
        super.init(
			title: ConstString("Products"),
            delegate: ViewDelegates(
				delegates: [
					closing,
					TableView(
                        tableView: Memory<UITableView?>(value: nil),
						dataSource: items,
						delegate: items
					),
					CancelButton(
						transition: DismissTransition()
					)
				]
			)
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
