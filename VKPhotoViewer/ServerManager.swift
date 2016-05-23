//
//  ServerManager.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 07.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class ServerManager: NSObject, ServerManagerInterface {
    
    // Simple singletone pattern
    static let sharedServerManager =  ServerManager()
    
    let invalidURLCode = 999
    let noDataCode = 998
    
    func getFromServer(urlString: String, completion:Result<NSData> -> Void) {
        
        // make sure the URL is valid, if not return custom error
        guard let url = NSURL(string: urlString) else { return completion(.Error("Invalid URL", invalidURLCode)) }
        
        let request = NSURLRequest(URL: url)
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            
            // if error returned, extract message and code then pass as Result enum
            guard error == nil else { return completion(.Error(error!.localizedDescription, error!.code)) }
            
            // if no data is returned, return custom error
            guard let data = data else { return completion(.Error("No data returned", self.noDataCode)) }
            
            // return success
            completion(.Success(data))
            }.resume()
    
    }

}
