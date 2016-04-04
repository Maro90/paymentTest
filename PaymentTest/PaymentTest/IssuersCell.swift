//
//  IssuersCell.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 4/4/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit


class IssuersCell: UITableViewCell {
    
    @IBOutlet weak var issuerNameLabel: UILabel!
    @IBOutlet weak var issuerImageView: UIImageView!
    
    
    func clearCell() -> Void {
        self.issuerImageView.image = nil
        self.issuerNameLabel.text = nil
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}