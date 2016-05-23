//
//  AlbumCell.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 04.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    @IBOutlet weak var titelAlbum: UILabel!
    @IBOutlet weak var imageAlbum: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
