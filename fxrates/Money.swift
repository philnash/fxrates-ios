//
//  Money.swift
//  fxrates
//
//  Created by Phil Nash on 8/12/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

struct Money {
    let base: Currency
    
    func convert(amount: Double, from: Currency, to: Currency) -> Double {
        return amount * getRate(from: from, to: to);
    }
    
    func getRate(from from: Currency, to: Currency) -> Double {
        // If `from` is the `base` currency, just return the basic exchange rate for `to`
        if from == base {
            return to.rate
        }
        // If `to` is the `base` currency, return the basic inverse rate of the `from` currency
        if to == base {
            return 1 / from.rate
        }
        // Otherwise, return the `to` rate multipled by the inverse of the `from` rate to get the
        // relative exchange rate between the two currencies
        return to.rate * (1 / from.rate)
    }
}
