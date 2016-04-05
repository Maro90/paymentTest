//
//  InstallementViewController.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 4/4/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

class InstallementViewController: UITableViewController {
    
    var installmentInfo = NSDictionary()
    var installmentList = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        RepositoryManager.getInstallmentsWithParameters(["amount":PaymentProcessInfo.sharedInstance.paymentMount,
            "payment_method_id":PaymentProcessInfo.sharedInstance.paymentMethodId,
            "issuer.id":PaymentProcessInfo.sharedInstance.paymentIssuerId]) { (responseList, error) in
                
                if error == nil{
                    self.installmentInfo = responseList[0] as! NSDictionary
                    self.installmentList = (self.installmentInfo.objectForKey("payer_costs") as? [[String : AnyObject]])!
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
        return self.installmentList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("installementCell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        cell.textLabel!.text = (self.installmentList.objectAtIndex(indexPath.row) as! NSDictionary).objectForKey("recommended_message") as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        PaymentProcessInfo.sharedInstance.paymentInstallement = ((self.installmentList.objectAtIndex((self.tableView.indexPathForSelectedRow?.row)!) as! NSDictionary).objectForKey("recommended_message") as! String)

        
        let message = "Monto de pago: \(PaymentProcessInfo.sharedInstance.paymentMount) \nMedio de pago: \(PaymentProcessInfo.sharedInstance.paymentMethodName) \nBanco: \(PaymentProcessInfo.sharedInstance.paymentIssuerName) \nCuotas: \(PaymentProcessInfo.sharedInstance.paymentInstallement) \n"
        
        let alertController = UIAlertController(title: "Datos de tu pago", message: message, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default) { (alert) in
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)

        
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
