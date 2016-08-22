//
//  CurrenciesViewController.swift
//  fxrates
//
//  Created by Phil Nash on 8/2/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class CurrenciesViewController: UITableViewController {

    var currencyStore: CurrencyStore!
    var filteredCurrencies = [Currency]()
    var didSelectCurrency: ((Currency) -> Void)!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredCurrencies.count
        }
        return currencyStore.currencies.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("currencyCell", forIndexPath: indexPath)

        let currency: Currency
        if searchController.active && searchController.searchBar.text != "" {
            currency = filteredCurrencies[indexPath.row]
        } else {
            currency = currencyStore.currencies[indexPath.row]
        }
        let detail = CurrencyMapping.details(currency.code)
        if detail.name != "" {
            cell.textLabel?.text = "\(currency.code) - \(detail.name)"
            cell.detailTextLabel?.text = detail.flag
        } else {
            cell.textLabel?.text = currency.code
        }

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currency: Currency
        if searchController.active && searchController.searchBar.text != "" {
            currency = filteredCurrencies[indexPath.row]
        } else {
            currency = currencyStore.currencies[indexPath.row]
        }
        didSelectCurrency(currency)
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func filterContentsForSearchText(searchText: String) {
        filteredCurrencies = currencyStore.currencies.filter { currency in
            let detail = CurrencyMapping.details(currency.code)
            return currency.code.lowercaseString.containsString(searchText.lowercaseString) || detail.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        tableView.reloadData()
    }
    
    func cancel(sender: UIBarButtonItem) -> Void {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    deinit {
        self.searchController?.view.removeFromSuperview()
    }
}

extension CurrenciesViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentsForSearchText(searchController.searchBar.text!)
    }
}