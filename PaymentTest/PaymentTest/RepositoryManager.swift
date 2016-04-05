//
//  RepositoryManager.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 4/3/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import UIKit
import Alamofire

class RepositoryManager: NSObject {
    
    private static func connectToURL(baseUrl:String,uri:String,connectionMethod:Alamofire.Method, parameters:NSDictionary, completionResponse: (responseList: NSArray, error: NSError?)->Void) {

        
        let url = baseUrl + uri
        
        Alamofire.request(connectionMethod, url, parameters: parameters as? [String : AnyObject], encoding: .URL, headers: nil).responseJSON { (response) in
            
            if response.result.isSuccess {
                if let arrMethods = response.result.value as? [[String : AnyObject]] {
                    completionResponse(responseList: arrMethods, error: nil)
                    
                }                
            } else{
                completionResponse(responseList: NSArray(), error: response.result.error)
                
            }
            
        }
        
    }
    
    static func getPaymentMethods(completionResponse: (responseList: NSArray, error: NSError?)->Void){
    
        let paramet = NSMutableDictionary()
        
        paramet.setObject(GlobalSttings.getPublicKey(), forKey: "public_key")

        connectToURL(GlobalSttings.getBaseURL(), uri: GlobalSttings.getUriPaymentMethods(), connectionMethod: .GET,
                     parameters: paramet){   (responseList, error) in
                        completionResponse(responseList: responseList, error: error)
    
        }
    }
    
    
    static func getCardIssuersWithParameters(parameters:NSDictionary, completionResponse: (responseList: NSArray, error: NSError?)->Void){
        
        let paramet = NSMutableDictionary(dictionary: parameters)
        
        paramet.setObject(GlobalSttings.getPublicKey(), forKey: "public_key")
        
        connectToURL(GlobalSttings.getBaseURL(), uri: GlobalSttings.getUriCardIssuers(), connectionMethod: .GET,
                     parameters: paramet){   (responseList, error) in
                        completionResponse(responseList: responseList, error: error)
                        
        }
    }
    
    static func getInstallmentsWithParameters(parameters:NSDictionary, completionResponse: (responseList: NSArray, error: NSError?)->Void){
        
        let paramet = NSMutableDictionary(dictionary: parameters)
        
        paramet.setObject(GlobalSttings.getPublicKey(), forKey: "public_key")
        
        connectToURL(GlobalSttings.getBaseURL(), uri: GlobalSttings.getUriInstallments(), connectionMethod: .GET,
                     parameters: paramet){   (responseList, error) in
                        completionResponse(responseList: responseList, error: error)
                        
        }
    }


}
