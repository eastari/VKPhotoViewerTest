//
//  AlbumListAssembly.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 13.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class AlbumListAssembly
{
    class func createModule() -> AlbumListModuleInput
    {
        let presenter = AlbumListPresenter()
        let vc = initializeViewController()
        let interactor = AlbumListInteractor()
        let router = AlbumListRouter()
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        vc.output = presenter
        interactor.output = presenter
        
        router.presenter = presenter
        router.viewController = vc
        
        // Dependences on the services
        interactor.httpString = URLStringBuilder()
        interactor.parseDataAPI = ParseDataService()
        interactor.serverAPI = ServerManager()
        interactor.jsonSerialization = JSON()
        
        presenter.photosListScreen = PhotosListAssembly.createModule()
        
        return presenter
    }
    
    private class func initializeViewController() -> AlbumListViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("AlbumListViewController") as! AlbumListViewController
        
        return vc
    }
}
