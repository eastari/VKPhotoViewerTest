//
//  AlbumListInteractor.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 13.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class AlbumListInteractor: AlbumListInteractorInput {
    
    weak var output: AlbumListInteractorOutput!
    
    var serverAPI: ServerManagerInterface!
    var httpString: URLStringBuilderInterface!
    var parseDataAPI: ParseDataServiceInterface!
    var jsonSerialization: JSONInterface!
    
    
    func loadAlbums(user: User)  {
        
        let parametersOfRequest: NSDictionary =
        [
            "user_id"      : user.userId!,
            "access_token" : user.accessToken!
        ]
        
        let mainService = MainServiceGetModel(urlStringBuilder: URLStringBuilder(), serverManager: ServerManager(), json: JSON(), parseDataService: ParseDataService())
        
        mainService.getModels(parametersOfRequest, completion: { (model) -> Void in
            
            if model!.count > 0 {
                self.output.modelDidLoad(model!)
            } else {
                self.output.modelIsEmpty()
            }
            
        })

    }

}
