//
//  MountViewController.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 3/31/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

class MountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToPaymentList" {
            //I should pass mount
        }
        
        
        
    }

}

