//
//  ImageDownloader.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 06.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit


class ImageDownloader: NSOperation {
    
    let photoRecord: ImageParentDomainModel
    var cacheDirectoryPath: String?
    
    init(photoRecord: ImageParentDomainModel) {
        self.photoRecord = photoRecord
    }
    
    override func main() {

        cacheDirectoryPath = CacheService.sharedCacheUpdater.createCachePath()
        
        let imageHashNumber = String(self.photoRecord.imageURL).hash
        let imageDevicePath = (self.cacheDirectoryPath! as NSString).stringByAppendingPathComponent("\(imageHashNumber)")
        let theManager = NSFileManager.defaultManager()
        let success = theManager.fileExistsAtPath(imageDevicePath)
            
            if success {
                NSLog("Loaded from cache: \(imageDevicePath)")
                if let theImage = UIImage(contentsOfFile: imageDevicePath) {
                    self.photoRecord.image = theImage
                    self.photoRecord.state = .Downloaded
                }
                
            } else {
                NSLog("Loaded from URL: \(String(self.photoRecord.imageURL))")
                
                if self.cancelled {
                    return
                }
                var imageData = NSData()
                
                if let url = self.photoRecord.imageURL {
                  
                    imageData = NSData(contentsOfURL:url)!
                }
                
                if self.cancelled {
                    return
                }
                
                if imageData.length > 0 {
                    self.photoRecord.image = UIImage(data:imageData)
                    self.photoRecord.state = .Downloaded
                    self.cacheImage(imageData, withPath: String(self.photoRecord.imageURL))
                } else {
                    self.photoRecord.state = .Failed
                }
                
            }
    }
    
    
    // MARK: Cache Image
    
    func cacheImage( data: NSData, withPath path: String) {
        let imageHashNumber = path.hash
        
        let imageDevicePath = (self.cacheDirectoryPath! as NSString).stringByAppendingPathComponent("\(imageHashNumber)")
        self.writeData(data, atPath:imageDevicePath)
    }
    
    
    func writeData( data: NSData, atPath path: String) -> Bool {
        let success = data.writeToFile(path, atomically: true)
        
        if !success {
            NSLog("Failed to save file \(path)")
        }
        
        return success
    }
}

// to track the status of each operation
class TrackingOperations {
    lazy var downloadsInProgress = [NSIndexPath:NSOperation]()
    lazy var downloadQueue:NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "Download queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
}

