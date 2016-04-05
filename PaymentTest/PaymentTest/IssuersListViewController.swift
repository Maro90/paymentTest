//
//  IssuersListViewController.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 4/3/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

class IssuersListViewController: UITableViewController {

    
    var issuersList = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
       
        RepositoryManager.getCardIssuersWithParameters(["payment_method_id":PaymentProcessInfo.sharedInstance.paymentMethodId]) { (responseList, error) in
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
        let cell = tableView.dequeueReusableCellWithIdentifier("issuerCell", forIndexPath: indexPath) as! IssuersCell
        
        // Configure the cell...
        
        cell.clearCell()
        
        cell.issuerNameLabel.text = (self.issuersList.objectAtIndex(indexPath.row) as! NSDictionary).objectForKey("name") as? String
        
        
        
        let imageURL = (self.issuersList.objectAtIndex(indexPath.row) as! NSDictionary).objectForKey("secure_thumbnail") as? String
        cell.issuerImageView.imageFromUrl(imageURL!)
        
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToInstallementList" {
            PaymentProcessInfo.sharedInstance.paymentIssuerId = ((self.issuersList.objectAtIndex((self.tableView.indexPathForSelectedRow?.row)!) as! NSDictionary).objectForKey("id") as! String)
            PaymentProcessInfo.sharedInstance.paymentIssuerName = ((self.issuersList.objectAtIndex((self.tableView.indexPathForSelectedRow?.row)!) as! NSDictionary).objectForKey("name") as! String)
            //self.paymentIdSelected
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
