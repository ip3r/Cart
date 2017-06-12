//
//  InMemoryCart.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class InMemoryCart: CartItems {
	private var items: Memory<[UUID:Memory<[String:String]>]>
	private let item: (UUID) -> (CartItem)
	
	// MARK: Init
    
	internal required init(items: Memory<[UUID:Memory<[String:String]>]>, item: @escaping (UUID) -> (CartItem)) {
        self.items = items
		self.item = item
    }
    
    // MARK: CartItems
	
	var count: Int {
		return items.value.count
	}
	
	func insert(product: Product) {
		items.value[UUID()] = Memory(value: ["product":product.uuid.uuidString])
	}
	
	subscript(index: Int) -> CartItem {
		let uuid = Array(items.value.keys)[index]
		return item(uuid)
	}
}
