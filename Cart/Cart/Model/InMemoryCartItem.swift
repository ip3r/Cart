//
//  InMemoryCartItem.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class InMemoryCartItem: CartItem {
	private var items: Memory<[UUID:Memory<[String:String]>]>
	private let productClosure: (UUID) -> (Product)
	
	// MARK: Init
    
    internal init(key: UUID, items: Memory<[UUID:Memory<[String:String]>]>, productClosure: @escaping (UUID) -> (Product)) {
        self.uuid = key
		self.items = items
		self.productClosure = productClosure
    }
    
    // MARK: CartItem
    
    let uuid: UUID
    
	var product: Product {
		return productClosure(UUID(uuidString: items.value[uuid]!.value["product"]!)!)
	}
	
	func delete() {
		items.value.removeValue(forKey: uuid)
	}
}
