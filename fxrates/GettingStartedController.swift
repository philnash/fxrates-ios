//
//  GettingStartedController.swift
//  fxrates
//
//  Created by Phil Nash on 8/19/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class GettingStartedController: UIViewController {
    var currencyStore: CurrencyStore!
    var mainCurrency: MainCurrency!
    var modalView: UINavigationController?
    
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet var loadingLabel: UILabel!
    @IBOutlet var selectCurrencyButton: UIButton!
    @IBOutlet var tryAgainButton: UIButton!
    @IBOutlet var selectCurrencyView: UIView!
    @IBOutlet var tryAgainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectCurrencyView.layer.borderWidth = 1
        selectCurrencyView.layer.borderColor = UIColor.whiteColor().CGColor
        selectCurrencyView.layer.cornerRadius = 6
        tryAgainView.layer.borderWidth = 1
        tryAgainView.layer.borderColor = UIColor.whiteColor().CGColor
        tryAgainView.layer.cornerRadius = 6
        
        currencyStore.getData { (result) -> Void in
            switch result {
            case .Success:
                dispatch_async(dispatch_get_main_queue(), {
                    self.currenciesDidLoad()
                })
                
            case .Failure(let error):
                self.currenciesDidNotLoad(error)
            }
        }
    }
    
    @IBAction func selectMainCurrency(sender: UIButton) {
        let newNavigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("currencySearch") as! UINavigationController
        let currenciesViewController = newNavigationController.topViewController as! CurrenciesViewController
        currenciesViewController.currencyStore = self.currencyStore
        currenciesViewController.didSelectCurrency = { (currency: Currency) in
            self.setMainCurrency(currency)
        }
        modalView = newNavigationController
        presentViewController(newNavigationController, animated: true, completion: nil)
    }
    
    @IBAction func tryAgainButtonPressed(sender: UIButton) {
        loadingIndicator.startAnimating()
        tryAgainView.hidden = true
        loadingLabel.text = "Loading currency data..."
        currencyStore.getData { (result) -> Void in
            switch result {
            case .Success:
                dispatch_async(dispatch_get_main_queue(), {
                    self.currenciesDidLoad()
                })
                
            case .Failure(let error):
                self.currenciesDidNotLoad(error)
            }
        }
    }
    
    func currenciesDidLoad() {
        loadingIndicator.stopAnimating()
        loadingIndicator.removeFromSuperview()
        loadingLabel.removeFromSuperview()
        selectCurrencyView.hidden = false
    }
    
    func currenciesDidNotLoad(error: ErrorType) {
        loadingIndicator.stopAnimating()
        loadingLabel.text = "There was an error fetching the latest currency data"
        tryAgainView.hidden = false
        print("there was an error fetching the latest currency data")
        print(error)
    }
    
    func moveToMainNavView() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainNavController = mainStoryboard.instantiateViewControllerWithIdentifier("mainNav") as! UINavigationController
        let converterViewController = mainNavController.topViewController as! ConverterViewController
        converterViewController.currencyStore = currencyStore
        converterViewController.mainCurrency = mainCurrency
        mainNavController.modalTransitionStyle = .CrossDissolve
        presentViewController(mainNavController, animated: true) {
            self.removeFromParentViewController()
        }
    }
    
    func setMainCurrency(currency: Currency) {
        mainCurrency.currency = currency
        mainCurrency.saveData()
        modalView?.dismissViewControllerAnimated(true) {
            self.modalView = nil
            self.moveToMainNavView()
        }
    }
}