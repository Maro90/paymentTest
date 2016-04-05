//
//  PaymentMethodsViewController.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 4/3/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

class PaymentMethodsViewController: UITableViewController {

    var paymentList = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        RepositoryManager.getPaymentMethodsWithParameters() { (responseList, error) in
            if error == nil{
                self.paymentList = responseList
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
        return self.paymentList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("paymentMethodCell", forIndexPath: indexPath) as! PaymentMethodCell

        // Configure the cell...

        cell.clearCell()
        
        cell.paymentMethodNameLabel.text = (self.paymentList.objectAtIndex(indexPath.row) as! NSDictionary).objectForKey("name") as? String
        
        
        
        let imageURL = (self.paymentList.objectAtIndex(indexPath.row) as! NSDictionary).objectForKey("thumbnail") as? String
        cell.paymentMethodImageView.imageFromUrl(imageURL!)


        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "goToBankList" {
            PaymentProcessInfo.sharedInstance.paymentMethodId = ((self.paymentList.objectAtIndex((self.tableView.indexPathForSelectedRow?.row)!) as! NSDictionary).objectForKey("id") as! String)
            PaymentProcessInfo.sharedInstance.paymentMethodName = ((self.paymentList.objectAtIndex((self.tableView.indexPathForSelectedRow?.row)!) as! NSDictionary).objectForKey("name") as! String)
            //self.paymentIdSelected
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
