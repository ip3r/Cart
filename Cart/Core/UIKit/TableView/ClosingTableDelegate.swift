//
//  ClosingTableDelegate.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class ClosingTableDelegate: NSObject, UITableViewDelegate, ViewDelegate {
	private var viewController: UIViewController?
	
	// MARK: ViewDelegate
	
	func viewWillAppear(viewController: UIViewController, animated: Bool) {
		self.viewController = viewController
	}
	
	func viewDidDisappear(viewController: UIViewController, animated: Bool) {
		self.viewController = nil
	}
	
    // MARK: UITableViewDelegate
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		viewController?.dismiss(animated: true, completion: nil)
	}
}
