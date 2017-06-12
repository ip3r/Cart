//
//  CurrenciesViewController.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CurrenciesViewController: ViewController {
	
	// MARK: Init
	
	internal required init(currencies: Currencies) {
		let closing = ClosingTableDelegate()
		let items = CurrenciesTableItems(
			currencies: currencies,
			origin: closing
		)
        let tableView = Memory<UITableView?>(value: nil)
		super.init(
			title: ConstString("Currencies"),
			delegate: ViewDelegates(
				delegates: [
					closing,
					TableView(
						tableView: tableView,
						dataSource: items,
						delegate: items
					),
					CancelButton(
						transition: DismissTransition()
					),
                    CurrencyRefresh(
                        currencies: JSONRates(
                            currencies: currencies
                        ),
                        refreshControl: UIRefreshControl(),
                        tableView: tableView
                    )
				]
			)
		)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
