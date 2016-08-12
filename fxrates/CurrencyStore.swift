//
//  CurrencyStore.swift
//  fxrates
//
//  Created by Phil Nash on 8/10/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

enum NetworkResult {
    case Success(NSData)
    case Failure(ErrorType)
}

enum JSONResult {
    case Success
    case Failure(ErrorType)
}

enum CurrencyResult {
    case Success
    case Failure(ErrorType)
}

enum JSONError: ErrorType {
    case DataNotPresent
}

class CurrencyStore {
    var currencies: [Currency]
    var currencyMetadata: CurrencyMetadata
    
    static let dataURL: String = "http://www.fxrat.es/rates.json"
    
    init() {
        if let path = CurrencyMetadata.archiveURL.path, archivedMetadata = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? CurrencyMetadata {
            currencyMetadata = archivedMetadata
        } else {
            self.currencyMetadata = CurrencyMetadata(timestamp: nil, disclaimer: nil, license: nil, base: nil)
        }
        
        if let path = Currency.archiveURL.path, archivedCurrencies = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [Currency] {
            currencies = archivedCurrencies
        } else {
            currencies = [Currency]()
        }
    }
    
    func getData(completion: ((CurrencyResult) -> Void)) -> Void {
        getDataFromURL(CurrencyStore.dataURL) { (result: NetworkResult) -> Void in
            switch result {
            case .Success(let data):
                let jsonResult = self.extractJSON(data)
                switch jsonResult {
                case .Success:
                    self.saveData()
                    completion(CurrencyResult.Success)
                case .Failure(let error):
                    completion(CurrencyResult.Failure(error))
                }
            case .Failure(let error):
                completion(CurrencyResult.Failure(error))
            }
            
        }
    }
    
    func getDataFromURL(url:String, completion: ((NetworkResult) -> Void)) -> Void {
        let url = NSURL(string: url)
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            var result: NetworkResult
            if nil != error {
                result = .Failure(error!)
            } else {
                result = .Success(data!)
            }
            completion(result)
        }
        dataTask.resume()
    }
    
    func extractJSON(jsonData: NSData) -> JSONResult {
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
                throw JSONError.DataNotPresent
            }
            currencyMetadata = CurrencyMetadata(timestamp: timestamp, disclaimer: disclaimer, license: license, base: base)
            currencies.removeAll()
            for (code, rate) in currencyArray {
                currencies.append(Currency(code: code, rate: rate))
            }
            currencies.sortInPlace { return $0.code < $1.code }

            return .Success
        } catch let error {
            return .Failure(error)
        }
    }
    
    func saveData() -> Bool {
        let metadataSaved = NSKeyedArchiver.archiveRootObject(currencyMetadata, toFile: CurrencyMetadata.archiveURL.path!)
        let currenciesSaved = NSKeyedArchiver.archiveRootObject(currencies, toFile: Currency.archiveURL.path!)
        return metadataSaved && currenciesSaved
    }

}