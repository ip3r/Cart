//
//  MemorySpec.swift
//  CartTests
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import XCTest
@testable import Cart

class MemorySpec: XCTestCase {
    
    func test_GIVEN_Memory_WHEN_value_THEN_shouldReturnTheEnclosedValue() {
        // GIVEN
        let mem = Memory<String>(value: "world")
        
        // WHEN
        let result = mem.value
        
        // THEN
        XCTAssertTrue(result == "world")
    }
    
}
