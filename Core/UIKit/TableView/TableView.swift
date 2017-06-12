//
//  TableView.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class TableView: ViewDelegate {
    private let tableView: Memory<UITableView?>
    private let delegate: UITableViewDelegate
    private let dataSource: UITableViewDataSource
	private let editing: Bool
    
	// MARK: Init
	
	internal convenience init(tableView: Memory<UITableView?>, dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
		self.init(
			tableView: tableView,
			dataSource: dataSource,
			delegate: delegate,
			editing: false
		)
	}
	
    internal required init(tableView: Memory<UITableView?>, dataSource: UITableViewDataSource, delegate: UITableViewDelegate, editing: Bool) {
        self.tableView = tableView
        self.dataSource = dataSource
        self.delegate = delegate
		self.editing = editing
    }
    
    // MARK: ViewDelegate
    
    func loadView(viewController: UIViewController) {
        tableView.value = UITableView()
        tableView.value?.dataSource = dataSource
        tableView.value?.delegate = delegate
        viewController.view = tableView.value
    }
    
    func viewDidLoad(viewController: UIViewController) {
        tableView.value?.setEditing(editing, animated: false)
    }
    
    func viewWillAppear(viewController: UIViewController, animated: Bool) {
        if let selectedRow = tableView.value?.indexPathForSelectedRow {
            tableView.value?.deselectRow(at: selectedRow, animated: false)
        }
        tableView.value?.reloadData()
    }
}
