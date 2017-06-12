//
//  ProductsTableData.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class ProductsTableData: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let products: Products
    private let identifier: OOString
	private let cartItems: CartItems
	private let origin: UITableViewDelegate
    
	// MARK: Init
    
	internal convenience init(products: Products, cartItems: CartItems, origin: UITableViewDelegate) {
        self.init(
            identifier: ConstString("product"),
            products: products,
            cartItems: cartItems,
            origin: origin
        )
    }
    
	internal required init(identifier: OOString, products: Products, cartItems: CartItems, origin: UITableViewDelegate) {
        self.products = products
        self.identifier = identifier
		self.cartItems = cartItems
		self.origin = origin
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier.stringValue)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: identifier.stringValue)
        }
        let product = self.products[indexPath.row]
        cell?.textLabel?.text = product.name.stringValue
		cell?.detailTextLabel?.text = String(format: "%.2f USD", arguments: [product.price.value])
        return cell!
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cartItems.insert(product: products[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: false)
		origin.tableView?(tableView, didSelectRowAt: indexPath)
    }
}
