//
//  Transition.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal protocol Transition: class {
	func transition(parent: UIViewController)
}

internal final class FakeTransition: Transition {

	// MARK: - Init
    
    internal init() {
        
    }
    
    // MARK: - Transition
    
	func transition(parent: UIViewController) {
		
	}
}
