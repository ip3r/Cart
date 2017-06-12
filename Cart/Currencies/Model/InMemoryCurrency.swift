//
//  InMemoryCurrency.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class InMemoryCurrency: Currency {
	private let currencies: Memory<[String: Float]>
    private let mapping: Memory<[String:String]>
	private let current: Memory<String>
	private let key: String
	
	// MARK: Init
    
    internal required init(currencies: Memory<[String: Float]>, key: String, current: Memory<String>, mapping: Memory<[String:String]>) {
        self.currencies = currencies
		self.key = key
		self.current = current
        self.mapping = mapping
    }
    
    // MARK: Currency
	
	var sign: OOString {
		return ConstString(key)
	}
	
	var name: OOString {
		return ConstString(mapping.value[key]!)
	}
	
	var rate: Double {
		get {
			return Double(currencies.value[key]!)
		}
		set {
			currencies.value[key]! = Float(newValue)
		}
	}
	
	func makeCurrent() {
		current.value = key
	}
}
