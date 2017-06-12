//
//  JSONRatesURL.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class JSONRatesURL: OOURLWrap {
    
	// MARK: Init
    
    internal required init() {
        super.init(
            origin: ConstURL(
                URL(string: "http://apilayer.net/api/live?access_key=" + APIToken().stringValue)!
            )
        )
    }
}
