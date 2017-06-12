//
//  CurrencyRefresh.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CurrencyRefresh: ViewDelegate {
	private let currencies: CurrencySource
	private let refreshControl: UIRefreshControl
	private let tableView: Memory<UITableView?>
	private weak var viewController: UIViewController?
	
	// MARK: Init
	
	internal required init(currencies: CurrencySource, refreshControl: UIRefreshControl, tableView: Memory<UITableView?>) {
		self.refreshControl = refreshControl
		self.tableView = tableView
		self.currencies = currencies
	}
    
    // MARK: ViewDelegate
    
    func viewDidLoad(viewController: UIViewController) {
        tableView.value?.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
	func viewDidAppear(viewController: UIViewController, animated: Bool) {
		self.viewController = viewController
		refresh()
	}
    
    func viewWillDisappear(viewController: UIViewController, animated: Bool) {
        self.viewController = nil
    }
    
	@objc func refresh() {
		refreshControl.beginRefreshing()
		currencies.reload { [weak self] (success) -> () in
            DispatchQueue.main.async {
				if !success {
                    let alert = UIAlertController(title: "Oops", message: "Could not download the exchange rates. Please check your internet connection and try again.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Alright", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self?.viewController?.present(alert, animated: true, completion: nil)
				}
                self?.refreshControl.endRefreshing()
            }
		}
	}
}
