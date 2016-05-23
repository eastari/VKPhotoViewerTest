//
//  PhotosListProtocols.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

protocol PhotosListModuleInput: class {
    
    func controller() -> UIViewController?
    func downloadWithAlbum(album: [PhotosDomainModel])
}

protocol PhotosListModuleOutput: class {
    
    func photoDidSelect(photo: PhotosDomainModel)
    func backToAlbumScreenDidSelect()
}

protocol PhotosListViewInput: class {
    
    func update(withData data:[PhotosDomainModel])
    func updateWithoutData()
}

protocol PhotosListViewOutput: class {
    
    func photoDidSelect(photo: PhotosDomainModel)
    func backButtonDidSelect()
}

protocol PhotosListInteractorInput: class {
    
}

protocol PhotosListInteractorOutput: class {

}

protocol PhotosListRouterInput: class {
    
    func controller() -> UIViewController?
    func dismiss()
    func presentPhotoScreen(photo: PhotosDomainModel)
}

