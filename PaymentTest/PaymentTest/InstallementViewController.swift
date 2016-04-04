//
//  InstallementViewController.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 4/4/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

class InstallementViewController: UITableViewController {
    
    var issuersList = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        RepositoryManager.connectToURL(GlobalSttings.getBaseURL(),
                                       uri: GlobalSttings.getUriInstallments(),
                                       connectionMethod: .GET,
                                       parameters: ["public_key":GlobalSttings.getPublicKey(),
                                        "payment_method_id":PaymentProcessInfo.sharedInstance.paymentMethodId,
                                        "amount":PaymentProcessInfo.sharedInstance.paymentMount,
                                        "issuer.id":PaymentProcessInfo.sharedInstance.paymentIssuerId]){ (responseList, error) in
                                        
                                        if error == nil{
                                            self.issuersList = responseList
                                            self.tableView.reloadData()
                                        }
        }
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
        return self.issuersList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("installementCell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        cell.textLabel!.text = (self.issuersList.objectAtIndex(indexPath.row) as! NSDictionary).objectForKey("name") as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //        self.performSegueWithIdentifier("goToBanks", sender: (self.issuersList.objectAtIndex(indexPath.row) as! NSDictionary).objectForKey("id") as? String)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}