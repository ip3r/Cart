//
//  InMemoryProduct.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class InMemoryProduct: Product {
	private let products: Memory<[UUID:Memory<[String:String]>]>
	
	// MARK: Init
    
	internal required init(uuid: UUID, products: Memory<[UUID:Memory<[String:String]>]>) {
        self.uuid = uuid
		self.products = products
    }
    
    // MARK: Product
	
	let uuid: UUID
	
	var name: OOString {
		return ConstString(products.value[uuid]!.value["name"]!)
	}
	
	var unit: Unit {
		return FakeUnit()
	}
	
	var price: Amount {
		return ConstAmount(value: Double(products.value[uuid]!.value["amount"]!)!)
	}
}
