//
//  OOURL.swift
//  Cart
//
//  Created by Jens Meder on 12.06.17.
//  Copyright © 2017 Jens Meder. All rights reserved.
//

import Foundation

internal protocol OOURL: class {
    var urlValue: URL {get}
}

internal final class FakeOOURL: OOURL {

	// MARK: - Init
    
    internal init() {
        
    }
    
    // MARK: - OOURL
    
    var urlValue: URL {
        return URL(string: "fake://url")!
    }
}

internal class OOURLWrap: OOURL {
    private let origin: OOURL
    
    // MARK: - Init
    
    internal init(origin: OOURL) {
        self.origin = origin
    }
    
    // MARK: - OOURL
    
    var urlValue: URL {
        return origin.urlValue
    }
}
