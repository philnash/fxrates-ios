//
//  MainCurrencyOwner.swift
//  fxrates
//
//  Created by Phil Nash on 8/19/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

protocol MainCurrencyOwner {
    func setMainCurrency(currency: Currency) -> Void
}
