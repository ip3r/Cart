//
//  InMemoryCartSpec.swift
//  CartTests
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import XCTest
@testable import Cart

class InMemoryCartSpec: XCTestCase {
    
    func test_GIVEN_InMemoryCart_WHEN_count_THEN_shouldReturnTheNumberOfItems() {
        // GIVEN
        let store = Memory<[UUID: Memory<[String:String]>]>(value: [UUID():Memory<[String:String]>(value: [:])])
        let cart = InMemoryCart(items: store) { (uuid) -> (CartItem) in
            return FakeCartItem(uuid: uuid)
        }
    
        // WHEN
        let result = cart.count
    
        // THEN
        XCTAssertTrue(result == 1)
    }
    
    func test_GIVEN_InMemoryCart_WHEN_subscript_THEN_shouldReturnCorrespondingItem() {
        // GIVEN
        let uuid = UUID()
        let store = Memory<[UUID: Memory<[String:String]>]>(value: [uuid:Memory<[String:String]>(value: [:])])
        let cart = InMemoryCart(items: store) { (uuid) -> (CartItem) in
            return FakeCartItem(uuid: uuid)
        }
        
        // WHEN
        let result = cart[0]
        
        // THEN
        XCTAssertNotNil(result.uuid == uuid)
    }
    
    func test_GIVEN_InMemoryCart_WHEN_insert_THEN_shouldIncreaseCount() {
        // GIVEN
        let uuid = UUID()
        let store = Memory<[UUID: Memory<[String:String]>]>(value: [:])
        let cart = InMemoryCart(items: store) { (uuid) -> (CartItem) in
            return FakeCartItem(uuid: uuid)
        }
        
        // WHEN
        cart.insert(product: FakeProduct(uuid: uuid))
        
        // THEN
        XCTAssertTrue(!store.value.isEmpty)
    }
    
    func test_GIVEN_InMemoryCart_WHEN_insert_THEN_shouldAddItem() {
        // GIVEN
        let uuid = UUID()
        let store = Memory<[UUID: Memory<[String:String]>]>(value: [:])
        let cart = InMemoryCart(items: store) { (uuid) -> (CartItem) in
            return FakeCartItem(uuid: uuid)
        }
        
        // WHEN
        cart.insert(product: FakeProduct(uuid: uuid))
        
        // THEN
        XCTAssertTrue(store.value.first?.value.value["product"]! == uuid.uuidString)
    }
}
