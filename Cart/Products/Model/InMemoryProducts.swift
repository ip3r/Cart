//
//  InMemoryProducts.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class InMemoryProducts: Products {
	private let products: Memory<[UUID:Memory<[String:String]>]>
	private let product: (UUID) -> (Product)
	
	// MARK: Init
	
	internal required init(products: Memory<[UUID:Memory<[String:String]>]>, product: @escaping (UUID) -> (Product)) {
        self.products = products
		self.product = product
    }
    
    // MARK: Products
	
	var count: Int {
		return products.value.count
	}
	
	subscript(index: Int) -> Product {
		let uuid = Array(products.value.keys)[index]
		return product(uuid)
	}
}
