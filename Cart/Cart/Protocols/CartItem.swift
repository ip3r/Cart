//
//  CartItem.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol CartItem: class {
	var product: Product {get}
	func delete()
}

internal final class FakeCartItem: CartItem {

	// MARK: - Init
    
    internal init() {
        
    }
    
    // MARK: - CartItem
    
	var product: Product {
		return FakeProduct()
	}
	
	func delete() {
		
	}
}
