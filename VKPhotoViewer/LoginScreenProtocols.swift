//
//  LoginScreenProtocols.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 11.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation


protocol LoginScreenModuleInput: class {
    func present(fromWindow window: UIWindow)
}

protocol LoginScreenModuleOutput: class {
    func userInitialized(user: User)
}

protocol LoginScreenViewInput: class {
    
}

protocol LoginScreenViewOutput: class {
    
    func initializeVKSuccess(result: VKAuthorizationResult)
    func initializeVKFailed()
}

protocol LoginScreenInteractorInput {
    
    func initializeVKSuccess(result: VKAuthorizationResult)
    func initializeVKFailed()
}

protocol LoginScreenInteractorOutput: class {
    func userInitialized(user: User)
}

protocol LoginScreenRouterInput {
    
    func present(fromWindow window: UIWindow)
    func presentAlbumList(user: User)
}

