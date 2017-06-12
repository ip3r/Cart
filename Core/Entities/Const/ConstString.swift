//
//  ConstString.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class ConstString: OOString {

	// MARK: Init
    
    internal init(_ value: String) {
        self.stringValue = value
    }
    
    // MARK: OOString
    
    let stringValue: String
}
