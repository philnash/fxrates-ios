//
//  CurrencyStore.swift
//  fxrates
//
//  Created by Phil Nash on 8/10/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class CurrencyStore {
    var currencies = [Currency]()
    let currencyMetadata: CurrencyMetadata
    
    let currencyArchiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("currencies.archive")
    }()
    
    let metadataArchiveURL: NSURL = {
        let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.URLByAppendingPathComponent("metadata.archive")
    }()
    
    
    init() {
        if let path = metadataArchiveURL.path, archivedMetadata = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? CurrencyMetadata {
            currencyMetadata = archivedMetadata
        } else {
            self.currencyMetadata = CurrencyMetadata(timestamp: nil, disclaimer: nil, license: nil, base: nil)
        }
    }
    
    func getDataFromURL(url:String, completion: (() -> Void)) -> Void {
        let url = NSURL(string: url)
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let data = data {
                if data.length > 0 && error == nil{
                    self.extractJSON(data, completion: completion)
                }else if data.length == 0 && error == nil{
                    print("Nothing was downloaded")
                } else if error != nil{
                    print("Error happened = \(error)")
                }
            }
        }
        dataTask.resume()
    }
    
    func extractJSON(jsonData: NSData, completion: (() -> Void)) -> Void {
        do {
            let json: AnyObject? = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
            guard let
                jsonDictionary = json as? [NSObject: AnyObject],
                timestamp = jsonDictionary["timestamp"] as? NSTimeInterval,
                disclaimer = jsonDictionary["disclaimer"] as? String,
                license = jsonDictionary["license"] as? String,
                base = jsonDictionary["base"] as? String,
                currencyArray = jsonDictionary["rates"] as? [String: Double]
                else {
                    print("something went wrong")
                    return
            }
            currencyMetadata.disclaimer = disclaimer
            currencyMetadata.license = license
            currencyMetadata.base = base
            currencyMetadata.timestamp = timestamp
            for (code, rate) in currencyArray {
                currencies.append(Currency(code: code, rate: rate))
            }
            currencies.sortInPlace { return $0.code < $1.code }
        } catch let error {
            print(error)
        }
        completion()
    }

}