//
//  PaymentProcessInfo.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 4/4/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import Foundation

class PaymentProcessInfo: NSObject {
    
    var paymentMount    : String!
    
    var paymentMethodId : String!
    var paymentMethodName : String!
    
    var paymentIssuerId : String!
    var paymentIssuerName : String!
    
    var paymentInstallement : String!
    
    class var sharedInstance: PaymentProcessInfo {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: PaymentProcessInfo? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = PaymentProcessInfo()
        }
        return Static.instance!
    }
    
    
    
}