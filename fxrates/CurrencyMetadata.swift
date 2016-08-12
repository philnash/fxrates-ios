//
//  CurrencyMetadata.swift
//  fxrates
//
//  Created by Phil Nash on 8/11/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class CurrencyMetadata: NSObject, NSCoding {
    var timestamp: NSTimeInterval?
    var disclaimer: String?
    var license: String?
    var base: Currency?
    
    static let archiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("metadata.archive")
    }()
    
    var lastUpdated: NSDate? {
        if let ts = timestamp {
            return NSDate(timeIntervalSince1970: ts)
        } else {
            return nil
        }
    }
    
    init(timestamp: NSTimeInterval?, disclaimer: String?, license: String?, base: Currency?) {
        self.timestamp = timestamp
        self.disclaimer = disclaimer
        self.license = license
        self.base = base
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let t = timestamp    { aCoder.encodeDouble(t, forKey: "timestamp") }
        if let d = disclaimer   { aCoder.encodeObject(d, forKey: "disclaimer") }
        if let l = license      { aCoder.encodeObject(l, forKey: "license") }
        if let b = base         { aCoder.encodeObject(b, forKey: "base") }
    }
    
    required init?(coder aDecoder: NSCoder) {
        timestamp = aDecoder.decodeDoubleForKey("timestamp")
        disclaimer = aDecoder.decodeObjectForKey("disclaimer") as? String
        license = aDecoder.decodeObjectForKey("license") as? String
        base = aDecoder.decodeObjectForKey("base") as? Currency
    }
}
