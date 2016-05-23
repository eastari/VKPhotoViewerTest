//
//  MainServiceGetModel.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 20.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

// Facade pattern
class MainServiceGetModel {
    
    let urlStringBuilder: URLStringBuilder
    let serverManager: ServerManager
    let json: JSON
    let parseDataService: ParseDataService
    
    init(urlStringBuilder: URLStringBuilder, serverManager: ServerManager, json: JSON, parseDataService: ParseDataService) {
        
        self.urlStringBuilder = urlStringBuilder
        self.serverManager = serverManager
        self.json = json
        self.parseDataService = parseDataService
    }
    
    func getModels(parametersOfRequest: NSDictionary, completion: (model: [AlbumsDomainModel]?) -> Void) {
        
        var userId = ""
        if let id = parametersOfRequest["user_id"] as? String {
            userId = id
        }

        let urlString = self.urlStringBuilder.urlStringBuilder(.Albums, parameters: parametersOfRequest, accessToken: nil)
        
        serverManager.getFromServer(urlString) { result in
            switch result {
            case .Success(let data):
                // handle successful data response here
                
                if let dataForParse = self.json.jsonSerialization(data) {
                    
                    self.parseDataService.getModelsFromJSON(dataForParse, userId: userId, method: .Albums, accessToken: nil, completion: { (model) -> Void in
                        
                        if model.count > 0 {
                            completion(model: model)
                        } else {
                            completion(model: nil)
                        }
                    })
                    
                } else {
                    completion(model: nil)
                }
                
            case .Error(let msg, let code):
                // handle error here
                print("Error [\(code)]: \(msg)")
                completion(model: nil)
            }
        }
    }
}