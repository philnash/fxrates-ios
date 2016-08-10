//
//  CurrencyStore.swift
//  fxrates
//
//  Created by Phil Nash on 8/10/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class CurrencyStore {
    var allCurrencies = [Currency]()
    var lastUpdated: NSDate?
    var disclaimer: String?
    var license: String?
    var base: String?
    
    init() {
        let currency = Currency(code: "GBP", rate: 0.764863)
        allCurrencies.append(currency)
    }
}