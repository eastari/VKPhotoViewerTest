//
//  LoginScreenInteractor.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 11.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class LoginScreenInteractor: LoginScreenInteractorInput {
    
    weak var output: LoginScreenInteractorOutput!

    // MARK:  LoginScreenInteractorInput
    func initializeVKSuccess(result: VKAuthorizationResult) {
        
        var user = User()
        user.accessToken = result.token.accessToken
        user.userId = result.token.userId
        output.userInitialized(user)
    }
    
    func initializeVKFailed() {
        // TO DO:  handling errors
    }
    
        
}