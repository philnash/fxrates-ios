//
//  MainCurrency.swift
//  fxrates
//
//  Created by Phil Nash on 8/18/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class MainCurrency {
    var currency: Currency?
    
    static let archiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("maincurrency.archive")
    }()
    
    init() {
        if let path = MainCurrency.archiveURL.path, archivedCurrency = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? Currency {
            self.currency = archivedCurrency
        }
    }
    
    func saveData() -> Bool {
        if let c = currency {
            return NSKeyedArchiver.archiveRootObject(c, toFile: MainCurrency.archiveURL.path!)
        } else {
            return false
        }
    }
}
