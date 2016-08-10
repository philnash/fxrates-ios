//
//  CurrenciesViewController.swift
//  fxrates
//
//  Created by Phil Nash on 8/2/16.
//  Copyright © 2016 Phil Nash. All rights reserved.
//

import UIKit

class CurrenciesViewController: UITableViewController {

    var currencies = [Currency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get_data_from_url("http://www.fxrat.es/rates.json")

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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currencies.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("currencyCell", forIndexPath: indexPath)

        cell.textLabel?.text = currencies[indexPath.row].code;

        return cell
    }

    func get_data_from_url(url:String) -> Void {
        let url = NSURL(string: url)
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let data = data {
                if data.length > 0 && error == nil{
                    self.extract_json(data)
                }else if data.length == 0 && error == nil{
                    print("Nothing was downloaded")
                } else if error != nil{
                    print("Error happened = \(error)")
                }
            }
        }
        dataTask.resume()
    }
    
    func extract_json(jsonData: NSData) -> Void {
        do {
            let json: AnyObject? = try NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
            print(json)
            guard let
                jsonDictionary = json as? [NSObject: AnyObject],
                currencyArray = jsonDictionary["rates"] as? [String: Double]
            else {
                print("something went wrong")
                return
            }
            
            for (code, rate) in currencyArray {
                currencies.append(Currency(code: code, rate: rate))
            }
            currencies.sortInPlace { return $0.code < $1.code }
        } catch let error {
            print(error)
        }
        do_table_refresh();
    }
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
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

}
