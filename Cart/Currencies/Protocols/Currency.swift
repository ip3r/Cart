//
//  Currency.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol Currency: class {
	var name: OOString {get}
	var rate: Double {get set}
	var sign: OOString {get}
	func makeCurrent()
}

internal final class FakeCurrency: Currency {

	// MARK: - Init
    
    internal init() {
        
    }
    
    // MARK: - Currency
	
	var sign: OOString {
		return FakeOOString()
	}
	
	var name: OOString {
		return FakeOOString()
	}
	
	var rate: Double = 0
	
	func makeCurrent() {
		
	}
}

internal class CurrencyWrap: Currency {
    private let origin: Currency
    
    // MARK: - Init
    
    internal init(origin: Currency) {
        self.origin = origin
    }
    
    // MARK: - Currency
    
    var sign: OOString {
        return origin.sign
    }
    
    var name: OOString {
        return origin.name
    }
    
    var rate: Double {
        get {
            return origin.rate
        }
        set {
            origin.rate = newValue
        }
    }
    
    func makeCurrent() {
        origin.makeCurrent()
    }
}
