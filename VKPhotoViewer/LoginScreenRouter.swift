//
//  LoginScreenRouter.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 11.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class LoginScreenRouter: LoginScreenRouterInput
{
    
    var navigationController: UINavigationController!
    var presenter: LoginScreenPresenter!
    weak var viewController: UIViewController?

    func present(fromWindow window: UIWindow) {
        if let controller = viewController {
            navigationController = UINavigationController(rootViewController: controller)
            navigationController.setNavigationBarHidden(true, animated: true)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    func presentAlbumList(user: User) {
        if let albumListController = presenter.albumListScreen.controller() {
            navigationController.pushViewController(albumListController, animated: true)
            presenter.albumListScreen.downloadWithUser(user)
            
        }
    }
    
}