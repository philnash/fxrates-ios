//
//  Currency.swift
//  fxrates
//
//  Created by Phil Nash on 8/4/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class Currency: NSObject, NSCoding {
    let code: String
    let rate: Double
    
    static let archiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("currencies.archive")
    }()
    
    init(code: String, rate: Double) {
        self.code = code
        self.rate = rate
    }
    
    func encodeWithCoder(aCoder: NSCoder) -> Void {
        aCoder.encodeObject(code, forKey: "code")
        aCoder.encodeDouble(rate, forKey: "rate")
    }
    
    required init?(coder aDecoder: NSCoder) {
        code = aDecoder.decodeObjectForKey("code") as! String
        rate = aDecoder.decodeDoubleForKey("rate")
        
        super.init()
    }
}
