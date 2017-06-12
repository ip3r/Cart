//
//  ConstURLSpec.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import XCTest
@testable import Cart

class ConstURLSpec: XCTestCase {
    
    func test_GIVEN_ConstURL_WHEN_urlValue_THEN_shouldReturnTheEnclosedValue() {
        // GIVEN
        let value = URL(string: "fake://test")!
        let url = ConstURL(value)
        
        // WHEN
        let result = url.urlValue
        
        // THEN
        XCTAssertTrue(result == value)
    }
    
}
