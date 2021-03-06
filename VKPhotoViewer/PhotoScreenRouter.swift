//
//  PhotoScreenRouter.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class PhotoScreenRouter: PhotoScreenRouterInput
{
    
    var navigationController: UINavigationController!
    var presenter: PhotoScreenPresenter!
    weak var viewController: UIViewController?
    
    
    func controller() -> UIViewController? {
        
        return viewController
    }
    
    func dismiss() {
        if let nc = viewController?.navigationController {
            nc.popViewControllerAnimated(true)
        }
    }
    
}
