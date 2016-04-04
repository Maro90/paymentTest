//
//  UIImage+setFromUrl.swift
//  PaymentTest
//
//  Created by Mauro Gonzalez on 4/4/16.
//  Copyright © 2016 Mauro Gonzalez. All rights reserved.
//

import Foundation
import AVKit

extension UIImageView{
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(NSURLRequest(URL: url)) {
                data, response, error in
                
                self.image = UIImage(data: data!, scale: 1)
            }
            task.resume()
        }
    }
}