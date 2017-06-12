//
//  CurrencySource.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol CurrencySource: class {
	func reload(completion: @escaping (Bool) -> ())
}

internal final class FakeCurrencySource: CurrencySource {

	// MARK: - Init
    
    internal init() {
        
    }
    
    // MARK: - CurrencySource
    
	func reload(completion: @escaping (Bool) -> ()) {
		
	}
}
