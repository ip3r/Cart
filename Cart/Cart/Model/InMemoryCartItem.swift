//
//  InMemoryCartItem.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class InMemoryCartItem: CartItem {
	private let key: UUID
	private var items: Memory<[UUID:Memory<[String:String]>]>
	private let productClosure: (UUID) -> (Product)
	
	// MARK: Init
    
    internal init(key: UUID, items: Memory<[UUID:Memory<[String:String]>]>, productClosure: @escaping (UUID) -> (Product)) {
        self.key = key
		self.items = items
		self.productClosure = productClosure
    }
    
    // MARK: CartItem
	
	var product: Product {
		return productClosure(UUID(uuidString: items.value[key]!.value["product"]!)!)
	}
	
	func delete() {
		items.value.removeValue(forKey: key)
	}
}
