//
//  ConstAmount.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class ConstAmount: Amount {
	
	// MARK: Init
    
	internal init(value: Double) {
        self.value = value
    }
    
    // MARK: Amount
	
	let value: Double
}
