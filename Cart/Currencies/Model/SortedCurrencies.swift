//
//  SortedCurrencies.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class SortedCurrencies: Currencies {
    private var keys: [String]
    private let origin: Currencies
    
	// MARK: Init
    
    internal required init(keys: [String], origin: Currencies) {
        self.keys = keys
        self.origin = origin
    }
    
    // MARK: Currencies
    
    var current: Currency {
        return origin.current
    }
    
    var count: Int {
        return origin.count
    }
    
    subscript(_ index: Int) -> Currency {
        return origin.currency(with: keys[index]).first!
    }
    
    func currency(with code: String) -> [Currency] {
        return origin.currency(with:code)
    }
}
