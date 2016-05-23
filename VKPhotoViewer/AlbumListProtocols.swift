//
//  AlbumListProtocols.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 04.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

protocol AlbumListModuleInput: class {
    
    func controller() -> UIViewController?
    func downloadWithUser(user: User)
}

protocol AlbumListModuleOutput: class {
    
}

protocol AlbumListViewInput: class {
    
    func update(withData data:[AlbumsDomainModel])
    func updateWithoutData()
}

protocol AlbumListViewOutput: class {
    
    func albumDidSelect(album: [PhotosDomainModel])
}

protocol AlbumListInteractorInput: class {
    
    func loadAlbums(user: User)
}

protocol AlbumListInteractorOutput: class {
    
    func modelDidLoad(model: [AlbumsDomainModel])
    func modelIsEmpty()
}

protocol AlbumListRouterInput: class {
    
    func controller() -> UIViewController?
    func dismiss()
    func presentPhotosList(album: [PhotosDomainModel])
}
