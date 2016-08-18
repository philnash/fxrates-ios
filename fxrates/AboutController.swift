//
//  AboutController.swift
//  fxrates
//
//  Created by Phil Nash on 8/18/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class AboutController: UIViewController {
    var currencyMetadata: CurrencyMetadata!
    
    @IBOutlet var disclaimerText: UITextView!
    @IBOutlet var licenseText: UITextView!
    @IBOutlet var aboutText: UITextView!
    
    @IBAction func closeButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disclaimerText.text = currencyMetadata.disclaimer
        licenseText.text = currencyMetadata.license
        let attributes = [NSUnderlineStyleAttributeName: 1]
        aboutText.linkTextAttributes = attributes
        disclaimerText.linkTextAttributes = attributes
        licenseText.linkTextAttributes = attributes
    }
}
