//
//  AlbumDomainModel.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 04.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class AlbumsDomainModel: ImageParentDomainModel {
    var title: String?
    var thumbId = -1
    var photos:[PhotosDomainModel]?
}


//class AlbumDomainModel
//{
//    var title: String
//    var thumbPhotoNumber = -1
//    var photos:[PhotoDomainModel]?
//    
//    init (title: String) {
//        self.title = title
//    }
//}




