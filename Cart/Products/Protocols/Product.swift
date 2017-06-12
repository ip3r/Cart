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
    var unit: Unit {get}
    var price: Amount {get}
}

internal final class FakeProduct: Product {

	// MARK: - Init
    
    internal convenience init() {
        self.init(
			uuid: UUID(),
            name: ConstString("Hello"),
            unit: FakeUnit(),
            price: FakeAmount()
        )
    }
    
	internal required init(uuid: UUID, name: OOString, unit: Unit, price: Amount) {
        self.name = name
        self.unit = unit
        self.price = price
		self.uuid = uuid
    }
    
    // MARK: - Product
	
	let uuid: UUID
	
    let name: OOString
    
    let unit: Unit
    
    let price: Amount
}
