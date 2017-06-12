//
//  Amount.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol Amount: class {
	var value: Double {get}
}

internal final class FakeAmount: Amount {

	// MARK: - Init
    
    internal init() {
        
    }
    
    // MARK: - Amount
	
	var value: Double {
		return 123
	}
}
