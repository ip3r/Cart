//
//  InMemoryCurrencies.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class InMemoryCurrencies: Currencies {
	private let currencies: Memory<[String: Float]>
	private let currentISO: Memory<String>
    private let closure: (String, Memory<String>) -> (Currency)
	
	// MARK: Init
    
    internal required init(currencies: Memory<[String: Float]>, currentISO: Memory<String>, closure: @escaping (String, Memory<String>) -> (Currency)) {
        self.currencies = currencies
		self.currentISO = currentISO
        self.closure = closure
    }
    
    // MARK: Currencies
	
	var current: Currency {
		return closure(currentISO.value, currentISO)
	}
	
	var count: Int {
		return currencies.value.count
	}
	
	subscript(index: Int) -> Currency {
		let key = Array(currencies.value.keys)[index]
		return closure(key, currentISO)
	}
	
	func currency(with code: String) -> [Currency] {
		var result: [Currency] = []
		if let _ = currencies.value[code] {
			result.append(closure(code, currentISO))
		}
		return result
	}
}
