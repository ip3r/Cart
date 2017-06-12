//
//  OOString.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol OOString: class {
    var stringValue: String {get}
}

internal final class FakeOOString: OOString {

	// MARK: - Init
    
    internal init() {
        
    }
    
    // MARK: - OOString
    
    var stringValue: String {
        return "Fake"
    }
}

internal class OOStringWrap: OOString {
    private let origin: OOString
    
    // MARK: - Init
    
    internal init(origin: OOString) {
        self.origin = origin
    }
    
    // MARK: - OOString
    
    var stringValue: String {
        return origin.stringValue
    }
}
