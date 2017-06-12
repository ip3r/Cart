//
//  InMemoryCartItemSpec.swift
//  CartTests
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import XCTest
@testable import Cart

class InMemoryCartItemSpec: XCTestCase {
    
    func test_GIVEN_InMemoryCartItem_WHEN_delete_THEN_shouldRemoveEntryFromStore() {
        // GIVEN
        let uuid = UUID()
        let store = Memory<[UUID: Memory<[String:String]>]>(value: [uuid:Memory<[String:String]>(value: [:])])
        let item = InMemoryCartItem(key: uuid, items: store) { (uuid) -> (Product) in
            return FakeProduct()
        }
        
        // WHEN
        item.delete()
    
        // THEN
        XCTAssertTrue(store.value.isEmpty)
    }
    
    func test_GIVEN_InMemoryCartItem_WHEN_product_THEN_shouldReturnAssociatedProduct() {
        // GIVEN
        let uuid = UUID()
        let key = UUID()
        let store = Memory<[UUID: Memory<[String:String]>]>(value: [key:Memory<[String:String]>(value: ["product":uuid.uuidString])])
        let item = InMemoryCartItem(key: key, items: store) { (uuid) -> (Product) in
            return FakeProduct(uuid: uuid)
        }
        
        // WHEN
        let result = item.product
        
        // THEN
        XCTAssertTrue(result.uuid == uuid)
    }
}
