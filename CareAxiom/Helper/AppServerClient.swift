//
//  AppServerClient.swift
//  CareAxiom
//
//  Created by Mahnoor Fatima on 19/08/2019.
//  Copyright © 2019 Mahnoor Fatima. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import ObjectMapper
import SwiftyJSON

class AppServerClient {
   
    
   
    
    func getPhotos(repository : PhotoRepository ) {
       
            Alamofire.request("https://jsonplaceholder.typicode.com/photos")
                .validate()
                .responseJSON{ response in
                    guard let object = response.result.value else {
                        print("Oh, no!!!")
                        return
                    }

                         let apiResponse = Mapper<PhotoDescription>().mapArray(JSONObject: response.result.value)
                        print(apiResponse?.count)
                        for item in apiResponse!
                        {
                            print(item.id)
                           repository.add(item)

                            
                        }
                       
                    
                    
        
        }
    }
 
    
}

