//
//  PhotoParser.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 18.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

/*
http://stackoverflow.com/questions/34048816/how-to-parse-json-into-uitableview/34049959
http://stackoverflow.com/questions/33624350/swift-how-to-parse-json-with-struct/33625429
http://stackoverflow.com/questions/31191569/swift-parse-json-to-struct/31194107

http://stackoverflow.com/questions/29360523/how-to-create-a-get-post-and-put-request-in-swift/29362770
*/

//var id = -1
//var text: String?
//var largeImageURL: NSURL?
//var smallImageURL: NSURL?

//extension PhotoDomainModel
//{
//    class func parse (fromJSON json: [String : AnyObject]) -> PhotoDomainModel?
//    {
//        guard let title = json["text"] as? String else {
//            return nil
//        }
//        
//        let model = PhotoDomainModel()
//        
//        
//        if let id = i["id"] as? Int {
//            model.id = id
//        } else {
//            break
//        }
//        
//        if let text = i["text"] as? String {
//            model.text = text
//        }
//        if let imageURL = i["photo_130"] as? String {
//            model.imageURL = NSURL(string: imageURL)
//        }
//        if let imageURLsize807 = i["photo_807"] as? String {
//            model.imageURLsize807 = NSURL(string: imageURLsize807)
//        }
//        
//        if model.id == thumbId  {
//            resultURL = model.imageURL!
//        }
//        resultModel.append(model)
//        
//        
//        
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
//
//}

