//
//  ConverterViewController.swift
//  fxrates
//
//  Created by Phil Nash on 8/16/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController{
    var currencyStore: CurrencyStore!
    var money: Money!
    var amount: Double!
    var mainCurrency: MainCurrency!
    var exchangeStore: ExchangeStore!
    
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
    @IBOutlet var lastUpdatedLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    @IBAction func moneyChanged(sender: UITextField) {
        if let text = toBeConverted.text, a = Double(text) {
            amount = a
        } else {
            amount = 0
        }
        tableView.reloadData()
//        if let text = toBeConverted.text, amount = Double(text) {
//            let convertedAmountDouble = money.convert(amount, from: currency1, to: currency2)
//            let convertedAmountString = currencyStringFormatter.stringFromNumber(convertedAmountDouble)
//            converted.text = convertedAmountString
//        } else {
//            converted.text = "0"
//        }
    }
    
    @IBAction func mainCurrencyChangePressed(sender: UIButton) {
        let newNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("currencySearch") as! UINavigationController
        let currenciesViewController = newNavigationController.topViewController as! CurrenciesViewController
        currenciesViewController.currencyStore = self.currencyStore
        currenciesViewController.opener = self
        presentViewController(newNavigationController, animated: true, completion: nil)
    }
    
    @IBAction func infoButtonPressed(sender: UIButton) {
        let aboutController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("aboutView") as! AboutController
        aboutController.currencyMetadata = currencyStore.currencyMetadata
        presentViewController(aboutController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exchangeStore = ExchangeStore()
        exchangeStore.currencies.append(currencyStore.currencies.first!)
        tableView.delegate = self
        tableView.dataSource = self
        
        if let currency = mainCurrency.currency {
            mainCurrencyLabel.text = currency.code
            currenciesReloaded()
            moneyChanged(toBeConverted)
        }
        
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tapRecogniser)
        
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

extension ConverterViewController: MainCurrencyOwner {
    func setMainCurrency(currency: Currency) -> Void {
        mainCurrency.currency = currency
        mainCurrencyLabel.text = currency.code
        moneyChanged(toBeConverted)
        mainCurrency.saveData()
    }
}

extension ConverterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exchangeStore.currencies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("exchangeCell", forIndexPath: indexPath)
        
        let currency = exchangeStore.currencies[indexPath.row]
        let detail = CurrencyMapping.details(currency.code)
        let convertedAmountDouble = money.convert(self.amount, from: mainCurrency.currency!, to: currency)
        let convertedAmountString = currencyStringFormatter.stringFromNumber(convertedAmountDouble)!
        if detail.name != "" {
            cell.textLabel?.text = "\(currency.code) \(convertedAmountString)"
            cell.detailTextLabel?.text = detail.name
        } else {
            cell.textLabel?.text = currency.code
        }
        return cell
    }
}












