//
//  Enums.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 11.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

// VK API
enum MethodsAPI: String {
    case Albums  = "photos.getAlbums"
    case Photos  = "photos.get"
}

// ServerManager result enum
enum Result<T> {
    case Success(T)
    case Error(String, Int)
}

// This enum contains all the possible states of image
enum ImageState {
    case New, Downloaded, Failed
}

