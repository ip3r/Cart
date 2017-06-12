//
//  SortedCurrenciesSpec.swift
//  CartTests
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import XCTest
@testable import Cart

class SortedCurrenciesSpec: XCTestCase {
    
    func test_GIVEN_SortedCurrencies_WHEN_current_THEN_shouldReturnCurrentCurrency() {
        // GIVEN
        let store = Memory<[String: Float]>(value: ["USD":1.23, "ALF": 222])
        let current = Memory<String>(value: "USD")
        let currencies = SortedCurrencies(
            keys: ["ALF", "USD"],
            origin: InMemoryCurrencies(
                currencies: store,
                currentISO: current,
                closure: { (key, current) -> (Currency) in
                    return InMemoryCurrency(
                        currencies: store,
                        key: key,
                        current: current,
                        mapping: Memory<[String:String]>(value: [:])
                    )
                }
            )
        )
        
        // WHEN
        let result = currencies.current
        
        // THEN
        XCTAssertTrue(result.sign.stringValue == "USD")
    }
    
    func test_GIVEN_SortedCurrencies_WHEN_count_THEN_shouldReturnNumberOfCurrencies() {
        // GIVEN
        let store = Memory<[String: Float]>(value: ["USD":1.23, "ALF": 222])
        let current = Memory<String>(value: "USD")
        let currencies = SortedCurrencies(
            keys: ["ALF", "USD"],
            origin: InMemoryCurrencies(
                currencies: store,
                currentISO: current,
                closure: { (key, current) -> (Currency) in
                    return InMemoryCurrency(
                        currencies: store,
                        key: key,
                        current: current,
                        mapping: Memory<[String:String]>(value: [:])
                    )
            }
            )
        )
        
        // WHEN
        let result = currencies.count
        
        // THEN
        XCTAssertTrue(result == 2)
    }
    
    func test_GIVEN_SortedCurrencies_WHEN_subscript_THEN_shouldReturnCurrencyAtIndex() {
        // GIVEN
        let store = Memory<[String: Float]>(value: ["USD":1.23, "ALF": 222])
        let current = Memory<String>(value: "USD")
        let currencies = SortedCurrencies(
            keys: ["ALF", "USD"],
            origin: InMemoryCurrencies(
                currencies: store,
                currentISO: current,
                closure: { (key, current) -> (Currency) in
                    return InMemoryCurrency(
                        currencies: store,
                        key: key,
                        current: current,
                        mapping: Memory<[String:String]>(value: [:])
                    )
            }
            )
        )
        
        // WHEN
        let result = currencies[0]
        
        // THEN
        XCTAssertTrue(result.sign.stringValue == "ALF")
    }
    
    func test_GIVEN_SortedCurrencies_WHEN_currency_AND_codeExists_THEN_shouldReturnArrayWithOneItem() {
        // GIVEN
        let store = Memory<[String: Float]>(value: ["USD":1.23, "ALF": 222])
        let current = Memory<String>(value: "USD")
        let currencies = SortedCurrencies(
            keys: ["ALF", "USD"],
            origin: InMemoryCurrencies(
                currencies: store,
                currentISO: current,
                closure: { (key, current) -> (Currency) in
                    return InMemoryCurrency(
                        currencies: store,
                        key: key,
                        current: current,
                        mapping: Memory<[String:String]>(value: [:])
                    )
            }
            )
        )
        
        // WHEN
        let result = currencies.currency(with: "USD")
        
        // THEN
        XCTAssertTrue(result.count == 1)
    }
    
    func test_GIVEN_SortedCurrencies_WHEN_currency_AND_codeExists_THEN_shouldReturnArrayWithCurrency() {
        // GIVEN
        let store = Memory<[String: Float]>(value: ["USD":1.23, "ALF": 222])
        let current = Memory<String>(value: "USD")
        let currencies = SortedCurrencies(
            keys: ["ALF", "USD"],
            origin: InMemoryCurrencies(
                currencies: store,
                currentISO: current,
                closure: { (key, current) -> (Currency) in
                    return InMemoryCurrency(
                        currencies: store,
                        key: key,
                        current: current,
                        mapping: Memory<[String:String]>(value: [:])
                    )
            }
            )
        )
        
        // WHEN
        let result = currencies.currency(with: "USD")
        
        // THEN
        XCTAssertTrue(result.first!.sign.stringValue == "USD")
    }
    
    func test_GIVEN_SortedCurrencies_WHEN_currency_AND_codeDoesNotExist_THEN_shouldReturnEmptyArray() {
        // GIVEN
        let store = Memory<[String: Float]>(value: ["USD":1.23, "ALF": 222])
        let current = Memory<String>(value: "USD")
        let currencies = SortedCurrencies(
            keys: ["ALF", "USD"],
            origin: InMemoryCurrencies(
                currencies: store,
                currentISO: current,
                closure: { (key, current) -> (Currency) in
                    return InMemoryCurrency(
                        currencies: store,
                        key: key,
                        current: current,
                        mapping: Memory<[String:String]>(value: [:])
                    )
            }
            )
        )
        
        // WHEN
        let result = currencies.currency(with: "UFO")
        
        // THEN
        XCTAssertTrue(result.isEmpty)
    }
    
}
