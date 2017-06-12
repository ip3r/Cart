//
//  JSONRatesURL.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class JSONRatesURL: OOURL {
	private let accessKey: OOString
	
	// MARK: Init
    
    internal init(accessKey: OOString) {
        self.accessKey = accessKey
    }
    
    // MARK: OOURL
	
	var urlValue: URL {
		return URL(string: "http://apilayer.net/api/live?access_key=" + accessKey.stringValue)!
	}
}
