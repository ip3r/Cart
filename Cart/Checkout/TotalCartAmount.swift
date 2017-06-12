//
//  TotalCartAmount.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class TotalCartAmount: Amount {
	private let cartItems: CartItems
	
	// MARK: Init
    
    internal init(cartItems: CartItems) {
        self.cartItems = cartItems
    }
    
    // MARK: Amount
	
	var value: Double {
		var total: Double = 0.0
		for i in 0..<cartItems.count {
			let item = cartItems[i]
			total += item.product.price.value
		}
		return total
	}
}
