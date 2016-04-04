//
//  PaymentMethodCell.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 4/4/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit

class PaymentMethodCell: UITableViewCell {
    
    @IBOutlet weak var paymentMethodNameLabel: UILabel!
    @IBOutlet weak var paymentMethodImageView: UIImageView!
    
    
    func clearCell() -> Void {
        self.paymentMethodImageView.image = nil
        self.paymentMethodNameLabel.text = nil
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
