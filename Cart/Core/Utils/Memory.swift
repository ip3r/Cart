//
//  Memory.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal class Memory<T> {
	public var value: T
	
	// MARK: Init
    
    internal init(value: T) {
        self.value = value
    }
}
