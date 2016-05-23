//
//  PhotosListRouter.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class PhotosListRouter: PhotosListRouterInput
{
    
    var navigationController: UINavigationController!
    var presenter: PhotosListPresenter!
    weak var viewController: UIViewController?
    
    
    func controller() -> UIViewController? {
        
        return viewController
    }
    
    func dismiss() {
        if let nc = viewController?.navigationController {
            nc.popViewControllerAnimated(true)
        }
    }
    
    func presentPhotoScreen(photo: PhotosDomainModel) {
        if let nc = viewController?.navigationController {
            if let photoScreenController = presenter.photoScreen.controller() {
                nc.pushViewController(photoScreenController, animated: true)
                presenter.photoScreen.downloadWithPhoto(photo)
            }
            
        }
        
    }
    
    
}
