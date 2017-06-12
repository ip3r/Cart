//
//  ConstURL.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal final class ConstURL: OOURL {

	// MARK: Init
    
    internal init(_ value: URL) {
        self.urlValue = value
    }
    
    // MARK: OOURL
    
    let urlValue: URL
}
