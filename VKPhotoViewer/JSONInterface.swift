//
//  JSONInterface.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 18.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

protocol JSONInterface: class
{
    func jsonSerialization(data: NSData) -> AnyObject?
}

