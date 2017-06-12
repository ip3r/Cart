//
//  Product.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol Product: class {
	var uuid: UUID {get}
    var name: OOString {get}
    var price: Amount {get}
}

internal final class FakeProduct: Product {

	// MARK: - Init
    
    internal convenience init() {
        self.init(
			uuid: UUID(),
            name: ConstString("Hello"),
            price: FakeAmount()
        )
    }
    
	internal required init(uuid: UUID, name: OOString, price: Amount) {
        self.name = name
        self.price = price
		self.uuid = uuid
    }
    
    // MARK: - Product
	
	let uuid: UUID
	
    let name: OOString
    
    let price: Amount
}
