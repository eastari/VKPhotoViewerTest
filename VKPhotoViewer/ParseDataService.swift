//
//  ParseDataService.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 08.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
// 

import Foundation


class ParseDataService: ParseDataServiceInterface {
    
    var urlStringBuilder: URLStringBuilderInterface!
    
    func getModelsFromJSON(json: AnyObject, userId: String, method: MethodsAPI, accessToken: String?, completion: (model: [AlbumsDomainModel]) -> Void) {
        
        self.urlStringBuilder = URLStringBuilder()

        var albums = [AlbumsDomainModel]()
        albums = parseJsonOfAlbums(json: json, method: .Albums)
    
        for i in albums {

            // url constructor
            let parametersOfRequest: NSDictionary =
            [
                "user_id"   : userId,
                "album_id"  : i.id,
            ]
            let url =  self.urlStringBuilder.urlStringBuilder(.Photos, parameters: parametersOfRequest, accessToken: accessToken)

            // request
            let data = NSData(contentsOfURL:NSURL(string: url)!)
            
            do{
                let jsonPhotos = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                (i.photos, i.imageURL) = (self.parseJsonOfPhotos(json: jsonPhotos, method: .Photos, thumbId: i.thumbId).0,
                    self.parseJsonOfPhotos(json: jsonPhotos, method: .Photos, thumbId: i.thumbId).1)
            } catch {
                print("Could not serialize")
            }
        }
        
        completion(model: albums)
    }
    
    private func parseJsonOfAlbums(json json: AnyObject, method: MethodsAPI) -> [AlbumsDomainModel] {
        
        var result = [AlbumsDomainModel]()
        
        if let items = parseJsonForGetItems(json) {
            for i in items {
                let model = AlbumsDomainModel()
                
                if let id = i["id"] as? Int {
                    model.id = id
                } else {
                    break
                }
                if let thumbId = i["thumb_id"] as? Int {
                    model.thumbId = thumbId
                }
                if let title = i["title"] as? String {
                    model.title = title
                }

                result.append(model)
                
            }
         }
       return result
    }

    private func parseJsonOfPhotos(json json: AnyObject, method: MethodsAPI, thumbId: Int) -> ([PhotosDomainModel], NSURL){
        
        var resultModel = [PhotosDomainModel]()
        var resultURL = NSURL()
        
        if let items = parseJsonForGetItems(json) {
            for i in items {
                let model = PhotosDomainModel()
                
                if let id = i["id"] as? Int {
                    model.id = id
                } else {
                    break
                }

                if let text = i["text"] as? String {
                    model.text = text
                }
                if let imageURL = i["photo_130"] as? String {
                    model.imageURL = NSURL(string: imageURL)
                }
                if let imageURLsize807 = i["photo_807"] as? String {
                    model.imageURLsize807 = NSURL(string: imageURLsize807)
                }
                
                if model.id == thumbId  {
                    resultURL = model.imageURL!
                }
                resultModel.append(model)
            }
        }
        return (resultModel, resultURL)
    }
    
    
    private func parseJsonForGetItems(json: AnyObject) -> [AnyObject]? {
        
        if let dict = json as? [String: AnyObject] {
            if let response = dict["response"] as AnyObject! {
                if let dict2 = response as? [String: AnyObject] {
                    if let items = dict2["items"] as AnyObject! {
                        if let items2 = items as? [AnyObject] {
                            return items2
                        }
                    }
                }
            }
        }
        
        return nil
        
    }
    
    
}
