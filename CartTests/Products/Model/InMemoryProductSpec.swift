//
//  InMemoryProductSpec.swift
//  CartTests
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import XCTest
@testable import Cart

class InMemoryProductSpec: XCTestCase {
    
	func test_GIVEN_InMemoryProduct_WHEN_name_THEN_shouldReturnName() {
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
		let product = InMemoryProduct(uuid:uuid, products: store)
	
		// When
		let result = product.name
	
		// Then
		XCTAssertTrue(result.stringValue == "Peas")
	}
	
	func test_GIVEN_InMemoryProduct_WHEN_price_THEN_shouldReturnAmountInUSD() {
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
		let product = InMemoryProduct(uuid:uuid, products: store)
		
		// When
		let result = product.price
		
		// Then
		XCTAssertTrue(result.value - 0.95 < 1e-6)
	}
	
	func test_GIVEN_InMemoryProduct_WHEN_uuid_THEN_shouldReturnItsIdentifier() {
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
		let product = InMemoryProduct(uuid:uuid, products: store)
		
		// When
		let result = product.uuid
		
		// Then
		XCTAssertTrue(result == uuid)
	}
}
