//
//  GlobalSettings.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 4/4/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import Foundation

public class GlobalSttings : NSObject {

    static func getBaseURL() -> String{
        return "https://api.mercadopago.com/v1/"
    }
    
    static func getUriPaymentMethods() -> String{
        return "payment_methods"
    }

    static func getUriCardIssuers() -> String{
        return "payment_methods/card_issuers"
    }

    static func getUriInstallments() -> String{
        return "payment_methods/installments"
    }
    
    static func getPublicKey() -> String{
        return "444a9ef5-8a6b-429f-abdf-587639155d88"
    }

}