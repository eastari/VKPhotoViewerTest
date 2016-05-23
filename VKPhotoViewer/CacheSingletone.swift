//
//  CacheServises.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 06.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class CacheServises: NSObject {
    
    // Simple singletone pattern
    static let sharedCacheUpdater =  CacheServises()
    
    var cachePath: String? = ""

    func createCachePath() {
        if let paths: [String]? = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)  {
            
            self.cachePath = (paths![0] as NSString).stringByAppendingPathComponent("images")
            let fileManager = NSFileManager.defaultManager()
            
            var isDirectory = ObjCBool(false)
            let folderExists = fileManager.fileExistsAtPath(cachePath!, isDirectory: &isDirectory) && isDirectory.boolValue
            if !folderExists {
                
                let isCreated: Bool
                do {
                    try fileManager.createDirectoryAtPath(cachePath!, withIntermediateDirectories: false, attributes: nil)
                    isCreated = true
                } catch {
                    isCreated = false
                }
                if !isCreated {
                    NSLog("Failed to create folder \(cachePath)")
                }
            }
        }
    }
}
