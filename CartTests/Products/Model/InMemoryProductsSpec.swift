//
//  InMemoryProductsSpec.swift
//  CartTests
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import XCTest
@testable import Cart

class InMemoryProductsSpec: XCTestCase {
    
	func test_GIVEN_InMemoryProducts_WHEN_count_THEN_shouldReturnNumberOfItems() {
		// Given
		let uuid = UUID()
		let store = Memory<[UUID: Memory<[String:String]>]>(
			value: [
				uuid : Memory(
					value: [
						"name": "Peas",
						"unit": "bag",
						"amount": "0.95"
					]
				),
				UUID() : Memory(
					value: [
						"name": "Eggs",
						"unit": "dozen",
						"amount": "2.10"
					]),
				UUID() : Memory(
					value: [
						"name": "Milk",
						"unit": "bottle",
						"amount": "1.30"
					]),
				UUID() : Memory(
					value: [
						"name": "Beans",
						"unit": "can",
						"amount": "0.73"
					])
			]
		)
		let products = InMemoryProducts(products: store) { (uuid) -> (Product) in
			return FakeProduct(uuid: uuid)
		}
		
		// When
		let result = products.count
		
		// Then
		XCTAssertTrue(result == 4)
	}
	
	func test_GIVEN_InMemoryProducts_WHEN_subscript_THEN_shouldReturnItem() {
		// Given
		let uuid = UUID()
		let store = Memory<[UUID: Memory<[String:String]>]>(
			value: [
				uuid : Memory(
					value: [
						"name": "Peas",
						"unit": "bag",
						"amount": "0.95"
					]
				)
			]
		)
		let products = InMemoryProducts(products: store) { (uuid) -> (Product) in
			return FakeProduct(uuid: uuid)
		}
		
		// When
		let result = products[0]
		
		// Then
		XCTAssertTrue(uuid == result.uuid)
	}
}
