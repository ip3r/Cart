//
//  CurrenciesTableItems.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import UIKit

internal final class CurrenciesTableItems: NSObject, UITableViewDataSource, UITableViewDelegate {
	private let currencies: Currencies
	private let identifier: OOString
	private let origin: UITableViewDelegate
	
	// MARK: Init
	
	internal convenience init(currencies: Currencies, origin: UITableViewDelegate) {
		self.init(
			identifier: ConstString("currency"),
			currencies: currencies,
			origin: origin
		)
	}
	
	internal required init(identifier: OOString, currencies: Currencies, origin: UITableViewDelegate) {
		self.currencies = currencies
		self.identifier = identifier
		self.origin = origin
	}
    
	// MARK: UITableViewDataSource
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return currencies.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CurrencyTableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier.stringValue) as? CurrencyTableViewCell
		if cell == nil {
			cell = CurrencyTableViewCell(identifier: identifier.stringValue)
            cell?.setup()
		}
		let currency = self.currencies[indexPath.row]
		cell?.updateName(name:  currency.name.stringValue)
        cell?.updateRate(rate: String(currency.rate) + " USD")
		cell?.updateISOCode(code: currency.sign.stringValue)
		return cell!
	}
	
	// MARK: UITableViewDelegate
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		currencies[indexPath.row].makeCurrent()
		origin.tableView?(tableView, didSelectRowAt: indexPath)
	}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
