//
//  ConverterViewController.swift
//  fxrates
//
//  Created by Phil Nash on 8/16/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    var currencyStore: CurrencyStore!
    var money: Money!
    var currency1 = Currency(code: "GBP", rate: 1)
    var currency2 = Currency(code: "GBP", rate: 1)
    
    let updatedDateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMM d, H:mm a"
        return formatter
    }()
    
    let currencyStringFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    
    
    @IBOutlet var toBeConverted: UITextField!
    @IBOutlet var mainCurrencyLabel: UILabel!
    @IBOutlet var converted: UILabel!
    @IBOutlet var convertedCurrencyLabel: UILabel!
    @IBOutlet var lastUpdatedLabel: UILabel!
    
    @IBAction func moneyChanged(sender: UITextField) {
        if let text = toBeConverted.text, amount = Double(text) {
            let convertedAmountDouble = money.convert(amount, from: currency1, to: currency2)
            let convertedAmountString = currencyStringFormatter.stringFromNumber(convertedAmountDouble)
            converted.text = convertedAmountString
        } else {
            converted.text = "0"
        }
    }
    
    @IBAction func mainCurrencyChangePressed(sender: UIButton) {
        let currenciesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("currencies") as! CurrenciesViewController
        currenciesViewController.currencyStore = self.currencyStore
        currenciesViewController.opener = self
        presentViewController(currenciesViewController, animated: true, completion: nil)
    }
    
    @IBAction func convertedCurrencyChangePressed(sender: UIButton) {
        
    }
    
    func setMainCurrency(currency: Currency) -> Void {
        currency1 = currency
        mainCurrencyLabel.text = currency1.code
        moneyChanged(toBeConverted)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tapRecogniser)
        
        currency1 = currencyStore.currencyFromCode("USD")!
        mainCurrencyLabel.text = currency1.code
        currency2 = currencyStore.currencyFromCode("GBP")!
        convertedCurrencyLabel.text = currency2.code
        
        currenciesReloaded()
        
        moneyChanged(toBeConverted)
        
        currencyStore.getData { (result) -> Void in
            switch result {
            case .Success:
                self.currenciesReloaded()
            case .Failure(_):
                // If result is an error and no existing saved data then show error message. Modal?
                print("there was an error fetching the latest currency data")
            }
            
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func currenciesReloaded() -> Void {
        if let base = currencyStore.currencyMetadata.base {
            money = Money(base: base)
        }
        
        if let lastUpdated = currencyStore.currencyMetadata.lastUpdated {
            lastUpdatedLabel.text = "Last updated: \(updatedDateFormatter.stringFromDate(lastUpdated))"
        }
    }
}
