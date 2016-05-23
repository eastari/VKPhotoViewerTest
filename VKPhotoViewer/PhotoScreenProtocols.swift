//
//  PhotoScreenProtocols.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

protocol PhotoScreenModuleInput: class {
    
    func controller() -> UIViewController?
    func downloadWithPhoto(photo: PhotosDomainModel)
}

protocol PhotoScreenModuleOutput: class {
    
    func photoDidSelect(photo: PhotosDomainModel)
    func backToAlbumScreenDidSelect()
}

protocol PhotoScreenViewInput: class {
    
    func updateWithPhoto(withPhoto photo: UIImage)
    func updateWithoutData()
}

protocol PhotoScreenViewOutput: class {
    
    func photoDidSelect(photo: PhotosDomainModel)
    func backButtonDidSelect()
}

protocol PhotoScreenInteractorInput: class {
    
    func loadPhoto(photo: PhotosDomainModel)
}

protocol PhotoScreenInteractorOutput: class {
    
    func photoDidLoad(photo: UIImage)
    func photoIsEmpty()
}

protocol PhotoScreenRouterInput: class {
    
    func controller() -> UIViewController?
    func dismiss()
}
