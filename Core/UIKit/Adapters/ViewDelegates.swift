//
//  ViewDelegates.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class ViewDelegates: ViewDelegate {
    private let delegates: [ViewDelegate]
    
	// MARK: Init
    
    internal required init(delegates: [ViewDelegate]) {
        self.delegates = delegates
    }
    
    // MARK: ViewDelegate
    
    func loadView(viewController: UIViewController) {
        for delegate in delegates {
            delegate.loadView(viewController: viewController)
        }
    }
    
    func viewDidLoad(viewController: UIViewController) {
        for delegate in delegates {
            delegate.viewDidLoad(viewController: viewController)
        }
    }
    
    func viewDidAppear(viewController: UIViewController, animated: Bool) {
        for delegate in delegates {
            delegate.viewDidAppear(viewController: viewController, animated: animated)
        }
    }
    
    func viewWillAppear(viewController: UIViewController, animated: Bool) {
        for delegate in delegates {
            delegate.viewWillAppear(viewController: viewController, animated: animated)
        }
    }
    
    func viewWillDisappear(viewController: UIViewController, animated: Bool) {
        for delegate in delegates {
            delegate.viewWillDisappear(viewController: viewController, animated: animated)
        }
    }
    
    func viewDidDisappear(viewController: UIViewController, animated: Bool) {
        for delegate in delegates {
            delegate.viewDidDisappear(viewController: viewController, animated: animated)
        }
    }
}
