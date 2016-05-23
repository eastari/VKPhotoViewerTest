//
//  LoginScreenViewController.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 11.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController, LoginScreenViewInput, VKSdkDelegate, VKSdkUIDelegate {
    
    weak var output: LoginScreenViewOutput!
   
    //MARK:  Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK:  Actions
    
    @IBAction func loginButton(sender: UIButton) {
        
        let vkSdk = VKSdk.initializeWithAppId(appId)
        vkSdk.registerDelegate(self)
        vkSdk.uiDelegate = self
        
        VKSdk.authorize([VK_PER_PHOTOS])
    }
    
    // MARK: VK UI delegate
    
    func vkSdkShouldPresentViewController(controller: UIViewController!) {
        presentViewController(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(captchaError: VKError!) {
        print(captchaError)
    }
    
    
    // MARK: VK delegate
    
    func vkSdkAccessAuthorizationFinishedWithResult(result: VKAuthorizationResult!) {
        guard result.token != nil else {
            print("Failure")
            return
        }
        print("Success")
        output.initializeVKSuccess(result)
    }
    
    func vkSdkUserAuthorizationFailed() {
        print("Failed")
        output.initializeVKFailed()
    }

}
