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
    
    static func connectToURL(baseUrl:String,uri:String,connectionMethod:Alamofire.Method, parameters:NSDictionary, completionResponse: (responseList: NSArray, error: NSError?)->Void) {

        
        let url = baseUrl + uri
        
        Alamofire.request(connectionMethod, url, parameters: parameters as? [String : AnyObject], encoding: .URL, headers: nil).responseJSON { (response) in
            
            print(response)
            
            if response.result.isSuccess {
                if let arrMethods = response.result.value as? [[String : AnyObject]] {
                    completionResponse(responseList: arrMethods, error: nil)
                    
                }
                
            } else{
                completionResponse(responseList: NSArray(), error: response.result.error)
                
            }
            
        }
        
    }

}
