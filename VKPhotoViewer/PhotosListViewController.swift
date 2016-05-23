//
//  PhotosListViewController.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 14.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit

class PhotosListViewController: UIViewController, PhotosListViewInput {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var output: PhotosListViewOutput!
    var data: [PhotosDomainModel]?
    let trackingOperations = TrackingOperations()
    var selectedPhoto: PhotosDomainModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.separatorStyle = .None
    }
    
    
    //MARK:  PhotosListViewInput
    
    func update(withData data:[PhotosDomainModel]) {
        self.data = data
        if let table = self.tableView {
            dispatch_async(dispatch_get_main_queue(), {
                table.reloadData()
            })
        }
    }
    
    func updateWithoutData() {
        // handle error here
    }
    
    //MARK:  Actions
    
    @IBAction func backButton(sender: UIButton) {
        
        output.backButtonDidSelect()
    }
    
        
    // MARK: Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let data = data {
            return data.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! AlbumCell
        
        cell.titelAlbum.text = data![indexPath.row].text!
        let photos = data![indexPath.row]
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        indicator.center = cell.imageAlbum.center
        
        switch (photos.state){
        case .New:
            self.startDownloadForRecord(photos, indexPath: indexPath)
            cell.imageAlbum.addSubview(indicator)
            indicator.startAnimating()
        case .Downloaded:
            cell.imageAlbum.image = photos.image
            indicator.stopAnimating()
            
        case .Failed:
            cell.imageAlbum.image = UIImage(named: "placeholder")
            indicator.stopAnimating()
            
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedPhoto = data![indexPath.row]
        output.photoDidSelect(selectedPhoto!)
    }
    
    // add operations to the download queue for photos in the table
    func startDownloadForRecord(photoDetails: PhotosDomainModel, indexPath: NSIndexPath){
        if let _ = trackingOperations.downloadsInProgress[indexPath] {
            return
        }
        let downloader = ImageDownloader(photoRecord: photoDetails)
        downloader.completionBlock = {
            if downloader.cancelled {
                return
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.trackingOperations.downloadsInProgress.removeValueForKey(indexPath)
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            })
        }
        trackingOperations.downloadsInProgress[indexPath] = downloader
        trackingOperations.downloadQueue.addOperation(downloader)
    }

}
