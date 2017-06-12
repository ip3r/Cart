//
//  CartItem.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol CartItem: class {
    var uuid: UUID {get}
	var product: Product {get}
	func delete()
}

internal final class FakeCartItem: CartItem {
    
	// MARK: - Init
    
    internal init(uuid: UUID) {
        self.uuid = uuid
    }
    
    // MARK: - CartItem
    
    let uuid: UUID
    
	var product: Product {
		return FakeProduct()
	}
	
	func delete() {
		
	}
}
