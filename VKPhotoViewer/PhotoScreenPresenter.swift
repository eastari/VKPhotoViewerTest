//
//  PhotoScreenPresenter.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class PhotoScreenPresenter:  PhotoScreenModuleInput, PhotoScreenViewOutput, PhotoScreenInteractorOutput
{
    var view: PhotoScreenViewInput!
    var interactor: PhotoScreenInteractorInput!
    var router: PhotoScreenRouterInput!


    //MARK:  PhotoScreenModuleInput
    
    func controller() -> UIViewController? {
        
        return router.controller()
    }
    
    func downloadWithPhoto(photo: PhotosDomainModel) {
        
        interactor.loadPhoto(photo)
    }
    
    //MARK:  PhotoScreenInteractorOutput
    
    func photoDidLoad(photo: UIImage) {
        view.updateWithPhoto(withPhoto: photo)
    }
    
    func photoIsEmpty() {
        view.updateWithoutData()
    }
    
    //MARK:  PhotoScreenViewOutput
    
    func photoDidSelect(photo: PhotosDomainModel) {
        
    }
    
    func backButtonDidSelect() {
        
        router.dismiss()
    }
    
}
