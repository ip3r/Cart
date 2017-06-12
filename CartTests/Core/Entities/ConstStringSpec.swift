//
//  ConstStringSpec.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import XCTest
@testable import Cart

class ConstStringSpec: XCTestCase {
    
    func test_GIVEN_ConstString_WHEN_stringValue_THEN_shouldReturnTheEnclosedValue() {
        // GIVEN
        let str = ConstString("hello")
        
        // WHEN
        let result = str.stringValue
        
        // THEN
        XCTAssertTrue(result == "hello")
    }
    
}
