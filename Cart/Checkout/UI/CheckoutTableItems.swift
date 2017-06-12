//
//  CheckoutTableItems.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CheckoutTableItems: NSObject, UITableViewDataSource, UITableViewDelegate {
	private let items: CartItems
	private let identifier: OOString
	private let currencies: Currencies
	
	// MARK: Init
	
	internal convenience init(items: CartItems, currencies: Currencies) {
		self.init(
			identifier: ConstString("checkoutItem"),
			items: items,
			currencies: currencies
		)
	}
	
	internal required init(identifier: OOString, items: CartItems, currencies: Currencies) {
		self.items = items
		self.identifier = identifier
		self.currencies = currencies
	}
	
	// MARK: UITableViewDataSource
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: identifier.stringValue)
		if cell == nil {
			cell = UITableViewCell(style: .value1, reuseIdentifier: identifier.stringValue)
		}
		let item = self.items[indexPath.row]
		cell?.textLabel?.text = item.product.name.stringValue
		let value = item.product.price.value * currencies.current.rate
		cell?.detailTextLabel?.text = String(format: "%.2f %@", arguments: [value, currencies.current.sign.stringValue])
		return cell!
	}
	
	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		return nil
	}
}
