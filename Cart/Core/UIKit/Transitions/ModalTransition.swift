//
//  ModalTransition.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class ModalTransition: Transition {
	private let viewController: () -> (UIViewController)
	
	// MARK: Init
    
	internal required init(viewController: @escaping () -> (UIViewController)) {
        self.viewController = viewController
    }
    
    // MARK: Transition
	
	func transition(parent: UIViewController) {
		parent.present(viewController(), animated: true, completion: nil)
	}
}
