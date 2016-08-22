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
    
    static let archiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("exchange.archive")
    }()
    
    init() {
        if let path = ExchangeStore.archiveURL.path, archivedExchanges = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [Currency] {
            currencies = archivedExchanges
        } else {
            currencies = [Currency]()
        }
    }
    
    func saveData() -> Bool {
        return NSKeyedArchiver.archiveRootObject(currencies, toFile: ExchangeStore.archiveURL.path!)
    }
}
