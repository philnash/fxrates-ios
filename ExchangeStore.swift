//
//  ExchangeStore.swift
//  fxrates
//
//  Created by Phil Nash on 8/19/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class ExchangeStore {
    var currencies: [Currency]
    var amount: Double
    
    static let archiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("exchange.archive")
    }()
    
    static let amountArchiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("amount.archive")
    }()
    
    init() {
        if let path = ExchangeStore.archiveURL.path, archivedExchanges = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [Currency] {
            currencies = archivedExchanges
        } else {
            currencies = [Currency]()
        }
        if let path = ExchangeStore.amountArchiveURL.path, archivedAmount = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? Double {
            amount = archivedAmount
        } else {
            amount = 100
        }
    }
    
    func saveData() -> Bool {
        let currenciesSaved = NSKeyedArchiver.archiveRootObject(currencies, toFile: ExchangeStore.archiveURL.path!)
        let amountSaved = NSKeyedArchiver.archiveRootObject(amount, toFile: ExchangeStore.amountArchiveURL.path!)
        return currenciesSaved && amountSaved
    }
}
