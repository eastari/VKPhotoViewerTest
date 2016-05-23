//
//  CacheSingletoneInterface.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 15.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

protocol CacheServiceInterface: class {
    
    func createCachePath() -> String?
    
}

