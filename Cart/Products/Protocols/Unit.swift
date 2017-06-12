//
//  Unit.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol Unit: class {
    var stringValue: OOString {get}
}

internal final class FakeUnit: Unit {

	// MARK: - Init
    
    internal init() {
        
    }
    
    // MARK: - Unit
    
    var stringValue: OOString {
        return FakeOOString()
    }
}
