//
//  AlbumParser.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 16.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

//extension AlbumDomainModel
//{
//    class func parse (fromJSON json: [String : AnyObject]) -> AlbumDomainModel?
//    {
//        guard let title = json["title"] as? String else {
//            return nil
//        }
//        
//        let model = AlbumDomainModel(title: title)
//        
//        if let thumbId = json["thumb_id"] as? Int {
//            model.thumbPhotoNumber = thumbId
//        }
//        
//        return model
//        
//    }
//
//    class func parse (fromArray array: [[String : AnyObject]]) -> [AlbumDomainModel]
//    {
//        var result = [AlbumDomainModel]()
//        
//        for item in array {
//            if let album = AlbumDomainModel.parse(fromJSON: item) {
//                result.append(album)
//            }
//        }
//        
//        return result
//    }
//}
