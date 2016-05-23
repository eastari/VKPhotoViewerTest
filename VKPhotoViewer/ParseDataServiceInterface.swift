//
//  ParseDataServiceInterface.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 08.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

protocol ParseDataServiceInterface: class {
    
    func getModelsFromJSON(json: AnyObject, userId: String, method: MethodsAPI, accessToken: String?, completion: (model: [AlbumsDomainModel]) -> Void)
    
}

