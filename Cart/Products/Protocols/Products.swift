//
//  Products.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol Products: class {
    var count: Int {get}
    subscript(_ index: Int) -> Product {get}
}

internal final class FakeProducts: Products {
    private let products: [Product]
    
	// MARK: - Init
    
    internal convenience init() {
        self.init(
            products: [
                FakeProduct(),
                FakeProduct(),
                FakeProduct()
            ]
        )
    }
    
    internal required init(products: [Product]) {
        self.products = products
    }
    
    // MARK: - Products
    
    var count: Int {
        return products.count
    }
    
    subscript(_ index: Int) -> Product {
        return products[index]
    }
}
