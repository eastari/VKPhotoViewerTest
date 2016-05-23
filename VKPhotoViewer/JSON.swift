//
//  JSON.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 16.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class JSON: JSONInterface
{
    func jsonSerialization(data: NSData) -> AnyObject?
    {
        do{
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
            return json
            
        }catch{
            print("Could not serialize")
            return nil
        }
    }
}
