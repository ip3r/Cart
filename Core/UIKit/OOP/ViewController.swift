//
//  ViewController.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal class ViewController: UIViewController {
    private let delegate: ViewDelegate
    
    // MARK: Init
	
	convenience init(delegate: ViewDelegate) {
		self.init(
			title: FakeOOString(),
			delegate: delegate
		)
	}
	
	init(title: OOString, delegate: ViewDelegate) {
        self.delegate = delegate
        super.init(
			nibName: nil,
			bundle: nil
		)
		self.title = title.stringValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Events
    
    override func loadView() {
        delegate.loadView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate.viewDidLoad(viewController: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate.viewDidAppear(viewController: self, animated: animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate.viewWillAppear(viewController: self, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate.viewWillDisappear(viewController: self, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate.viewDidDisappear(viewController: self, animated: animated)
    }
    
}

