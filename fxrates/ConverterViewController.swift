//
//  ConverterViewController.swift
//  fxrates
//
//  Created by Phil Nash on 8/16/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController, UIGestureRecognizerDelegate{
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
        currenciesViewController.didSelectCurrency = { (currency: Currency) in
            self.setMainCurrency(currency)
        }
        presentViewController(newNavigationController, animated: true, completion: nil)
    }
    
    @IBAction func infoButtonPressed(sender: UIButton) {
        let aboutController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("aboutView") as! AboutController
        aboutController.currencyMetadata = currencyStore.currencyMetadata
        presentViewController(aboutController, animated: true, completion: nil)
    }
    
    @IBAction func addCurrencyButtonPressed(sender: UIButton) {
        let newNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("currencySearch") as! UINavigationController
        let currenciesViewController = newNavigationController.topViewController as! CurrenciesViewController
        currenciesViewController.currencyStore = self.currencyStore
        currenciesViewController.didSelectCurrency = { (currency: Currency) in
            self.addNewCurrency(currency)
        }
        presentViewController(newNavigationController, animated: true, completion: nil)
    }
    
    @IBAction func editCurrenciesButtonPressed(sender: UIButton) {
        if tableView.editing {
            tableView.setEditing(false, animated: true)
            sender.setTitle("Edit currencies", forState: .Normal)
        } else {
            tableView.setEditing(true, animated: true)
            sender.setTitle("Done", forState: .Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exchangeStore = ExchangeStore()
        tableView.delegate = self
        tableView.dataSource = self
        
        if let currency = mainCurrency.currency {
            mainCurrencyLabel.text = currency.code
            currenciesReloaded()
            moneyChanged(toBeConverted)
        }
        
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tapRecogniser)
        tapRecogniser.delegate = self
        
        currencyStore.getData { (result) -> Void in
            switch result {
            case .Success:
                self.currenciesReloaded()
            case .Failure(_):
                // If result is an error and no existing saved data then show error message. Modal?
                print("there was an error fetching the latest currency data")
            }
            
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if let view = touch.view where String(view.dynamicType) == "UITableViewCellEditControl" {
            return false
        }
        return true
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
    
    func setMainCurrency(currency: Currency) -> Void {
        mainCurrency.currency = currency
        mainCurrencyLabel.text = currency.code
        moneyChanged(toBeConverted)
        mainCurrency.saveData()
    }
    
    func addNewCurrency(currency: Currency) -> Void {
        exchangeStore.currencies.append(currency)
        exchangeStore.saveData()
        tableView.reloadData()
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
        let convertedAmountDouble = money.convert(self.amount, from: currency, to: mainCurrency.currency!)
        let convertedAmountString = currencyStringFormatter.stringFromNumber(convertedAmountDouble)!
        let amountString = currencyStringFormatter.stringFromNumber(self.amount)!
        if detail.name != "" {
            cell.textLabel?.text = "\(amountString) \(currency.code) is"
            cell.detailTextLabel?.text = "\(convertedAmountString) \(mainCurrency.currency!.code)"
        } else {
            cell.textLabel?.text = currency.code
        }
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            exchangeStore.currencies.removeAtIndex(indexPath.row)
            exchangeStore.saveData()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
}












