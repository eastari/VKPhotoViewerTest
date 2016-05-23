//
//  PhotosListPresenter.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class PhotosListPresenter:  PhotosListModuleInput, PhotosListViewOutput, PhotosListInteractorOutput
{
    var view: PhotosListViewInput!
    var interactor: PhotosListInteractorInput!
    var router: PhotosListRouterInput!
    var photoScreen : PhotoScreenModuleInput!
    
    //MARK:  PhotosListModuleInput
    
    func controller() -> UIViewController? {
        
        return router.controller()
    }
    
    func downloadWithAlbum(album: [PhotosDomainModel]) {
        
        view.update(withData: album)
    }
    
    //MARK:  PhotosListViewOutput
    
    func photoDidSelect(photo: PhotosDomainModel) {
        
        router.presentPhotoScreen(photo)
    }
    
    func backButtonDidSelect() {
        
        router.dismiss()
    }
    
}

