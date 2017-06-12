//
//  TotalCartAmountSpec.swift
//  CartTests
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import XCTest
@testable import Cart

class TotalCartAmountSpec: XCTestCase {
    
    func test_GIVEN_TotalCartAmount_WHEN_value_THEN_shouldReturnSumOfAllCartItems() {
        // GIVEN
        let items = FakeCartItems()
        let amount = TotalCartAmount(cartItems: items)
        
        // WHEN
        let result = amount.value
        
        // THEN
        XCTAssertTrue(3*FakeAmount().value - result < 1e-6)
    }
    
}
