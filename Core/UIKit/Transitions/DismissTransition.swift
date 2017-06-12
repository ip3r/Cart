//
//  DismissTransition.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class DismissTransition: Transition {
	
	// MARK: Init
    
    internal init() {
        
    }
    
    // MARK: Transition
	
	func transition(parent: UIViewController) {
		parent.dismiss(animated: true, completion: nil)
	}
}
