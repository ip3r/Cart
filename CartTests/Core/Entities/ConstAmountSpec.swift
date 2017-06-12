//
//  ConstAmountSpec.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import XCTest
@testable import Cart

class ConstAmountSpec: XCTestCase {
    
    func test_GIVEN_ConstAmount_WHEN_value_THEN_shouldReturnTheEnclosedValue() {
        // GIVEN
        let amount = ConstAmount(value: 47.11)
    
        // WHEN
        let result = amount.value
    
        // THEN
        XCTAssertTrue(result.distance(to: 47.11) < 1e-6)
    }
}
