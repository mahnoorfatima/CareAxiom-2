//
//  Downloader.swift
//  MyProject
//
//  Created by Mahnoor Fatima on 15/08/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//
import UIKit

class Downloader {
    
    class func downloadImageWithURL(url:String) -> UIImage! {
        
        let data = NSData(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)
    }
}

