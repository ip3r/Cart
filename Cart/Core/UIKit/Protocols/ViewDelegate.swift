//
//  ViewDelegate.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal protocol ViewDelegate: class {
    func loadView(viewController: UIViewController)
    func viewDidLoad(viewController: UIViewController)
    func viewDidAppear(viewController: UIViewController, animated: Bool)
    func viewWillAppear(viewController: UIViewController, animated: Bool)
    func viewWillDisappear(viewController: UIViewController, animated: Bool)
    func viewDidDisappear(viewController: UIViewController, animated: Bool)
}

internal final class FakeViewDelegate: ViewDelegate {

	// MARK: - Init
    
    internal init() {
        
    }
    
}

extension ViewDelegate {
    func loadView(viewController: UIViewController) {
        
    }
    
    func viewDidLoad(viewController: UIViewController) {
        
    }
    
    func viewDidAppear(viewController: UIViewController, animated: Bool) {
        
    }
    
    func viewWillAppear(viewController: UIViewController, animated: Bool) {
        
    }
    
    func viewWillDisappear(viewController: UIViewController, animated: Bool) {
        
    }
    
    func viewDidDisappear(viewController: UIViewController, animated: Bool) {
        
    }
}
