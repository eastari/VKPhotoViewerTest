//
//  ServerManagerInterface.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

protocol ServerManagerInterface: class {
    
    func getFromServer(urlString: String, completion:Result<NSData> -> Void)
    
}
