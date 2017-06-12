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
	
	// MARK: Init
	
    internal required init(currencies: Memory<[String: Float]>, currentISO: Memory<String>) {
        self.currencies = currencies
		self.currentISO = currentISO
    }
    
    // MARK: Currencies
	
	var current: Currency {
		return InMemoryCurrency(
			currencies: currencies,
			key: currentISO.value,
			current: currentISO
		)
	}
	
	var count: Int {
		return currencies.value.count
	}
	
	subscript(index: Int) -> Currency {
		let key = Array(currencies.value.keys)[index]
		return InMemoryCurrency(
			currencies: currencies,
			key: key,
			current: currentISO
		)
	}
	
	func currency(with code: String) -> [Currency] {
		var result: [Currency] = []
		if let _ = currencies.value[code] {
			result.append(InMemoryCurrency(
				currencies: currencies,
				key: code,
				current: currentISO
			))
		}
		return result
	}
}
