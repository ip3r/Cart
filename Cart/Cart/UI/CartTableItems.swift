//
//  CartTableItems.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CartTableItems: NSObject, UITableViewDelegate, UITableViewDataSource {
	private let items: CartItems
	private let identifier: OOString
	private let button: UIBarButtonItem
	
	// MARK: Init
	
	internal convenience init(items: CartItems, button: UIBarButtonItem) {
		self.init(
			identifier: ConstString("cartItem"),
			items: items,
			button: button
		)
	}
	
	internal required init(identifier: OOString, items: CartItems, button: UIBarButtonItem) {
		self.items = items
		self.button = button
		self.identifier = identifier
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
		cell?.detailTextLabel?.text = String(format: "%.2f USD", arguments: [item.product.price.value])
		return cell!
	}
	
    // MARK: UITableViewDelegate
	
	func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
		return .delete
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		items[indexPath.row].delete()
		if items.count == 0 {
			button.isEnabled = false
		}
		tableView.deleteRows(at: [indexPath], with: .automatic)
	}
	
	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		return nil
	}
}
