//
//  CartItems.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol CartItems: class {
	var count: Int {get}
	func insert(product: Product)
	subscript(_ index: Int) -> CartItem {get}
}

internal final class FakeCartItems: CartItems {
	// MARK: - Init
    
    internal init() {
        
    }
    
    // MARK: - CartItems
	
	var count: Int {
		return 0
	}
	
	func insert(product: Product) {
		
	}
	
	subscript(index: Int) -> CartItem {
		return FakeCartItem()
	}
}
