//
//  RootRouter.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 10.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class RootRouter {
    
    var loginScreen : LoginScreenModuleInput?
    
    func setupRouter(window window: UIWindow) {
        loginScreen = LoginScreenAssembly.createModule()
        loginScreen!.present(fromWindow: window)
        
    }
    
}

