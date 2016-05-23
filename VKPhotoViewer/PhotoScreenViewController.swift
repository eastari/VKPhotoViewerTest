//
//  PhotoScreenViewController.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class PhotoScreenViewController: UIViewController, PhotoScreenViewInput {

    @IBOutlet weak var imageView: UIImageView!
    
    weak var output: PhotoScreenViewOutput!
    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        indicator.center = imageView.center
        imageView.addSubview(indicator)
        indicator.startAnimating()
    }
    
    //MARK:  Actions
    
    @IBAction func backButton(sender: UIButton) {
        
        output.backButtonDidSelect()
    }
    
    //MARK:  PhotoScreenViewInput

    func updateWithPhoto(withPhoto photo: UIImage) {
        
        dispatch_async(dispatch_get_main_queue(), {
            self.imageView.image = photo
            self.indicator.stopAnimating()
        })
    }
    
    func updateWithoutData() {
        // handle error here
    }

    
}
