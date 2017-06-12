//
//  Currencies.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol Currencies: class {
	var count: Int {get}
	var current: Currency {get}
	subscript(_ index: Int) -> Currency {get}
	func currency(with code: String) -> [Currency]
}

internal final class FakeCurrencies: Currencies {
	private let currencies: [Currency]
	
	// MARK: - Init
	
	internal convenience init() {
		self.init(
			currencies: [
				FakeCurrency(),
				FakeCurrency()
			]
		)
	}
	
    internal required init(currencies: [Currency]) {
        self.currencies = currencies
    }
    
    // MARK: - Currencies
	
	var current: Currency {
		return FakeCurrency()
	}
	
	var count: Int {
		return currencies.count
	}
	
	subscript(_ index: Int) -> Currency {
		return currencies[index]
	}
	
	func currency(with code: String) -> [Currency] {
		return []
	}
}

internal class CurrenciesWrap: Currencies {
    private let origin: Currencies
    
    // MARK: - Init
    
    internal init(origin: Currencies) {
        self.origin = origin
    }
    
    // MARK: - Currencies
    
    var current: Currency {
        return origin.current
    }
    
    var count: Int {
        return origin.count
    }
    
    subscript(_ index: Int) -> Currency {
        return origin[index]
    }
    
    func currency(with code: String) -> [Currency] {
        return origin.currency(with:code)
    }
}
