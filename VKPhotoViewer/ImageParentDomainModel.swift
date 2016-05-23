//
//  ImageParentDomainModel.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 20.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import Foundation

class ImageParentDomainModel {
    var id = -1
    var imageURL: NSURL?
    var state = ImageState.New
    var image = UIImage(named: "placeholder")
    
}
