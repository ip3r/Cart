//
//  JSONRates.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class JSONRates: CurrencySource {
	private let currencies: Currencies
	private let session: URLSession
	private let url: OOURL
	
	// MARK: Init
	
	internal convenience init(currencies: Currencies) {
		let configuration = URLSessionConfiguration.default
		configuration.urlCache = nil
		configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
		self.init(
			currencies: currencies,
			session: URLSession(
				configuration: configuration
			),
			url: JSONRatesURL(
				accessKey: APIToken()
			)
		)
	}
	
	internal required init(currencies: Currencies, session: URLSession, url: OOURL) {
        self.currencies = currencies
		self.session = session
		self.url = url
    }
    
    deinit {
        session.getAllTasks { (tasks) in
            for task in tasks {
                task.cancel()
            }
        }
    }
    
    // MARK: CurrencySource
	
	func reload(completion: @escaping (Bool) -> ()) {
		let task = session.dataTask(with: url.urlValue) { [weak self] (data, response, error) in
			if error == nil, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
				let json: [String: Any] = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : Any]
				if let quotes = json["quotes"] as? [String: NSNumber] {
					for (key, value) in quotes {
						let realKey = key.substring(from: key.index(key.startIndex, offsetBy: 3))
                        if let currency = self?.currencies.currency(with: realKey).first {
							currency.rate = value.doubleValue
						}
					}
					completion(true)
				}
				else {
					completion(false)
				}
			}
			else {
				completion(false)
			}
		}
		task.resume()
	}
}
