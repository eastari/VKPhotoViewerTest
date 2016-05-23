//
//  AlbumListViewController.swift
//  VKPhotoViewer
//
//  Created by Евгений Стариков on 04.05.16.
//  Copyright © 2016 Starikov Evgen. All rights reserved.
//

import UIKit


class AlbumListViewController: UIViewController, AlbumListViewInput {

    @IBOutlet weak var tableView: UITableView!
    
    weak var output: AlbumListViewOutput!
    var data: [AlbumsDomainModel]?
    let trackingOperations = TrackingOperations()
    var selectedAlbum: [PhotosDomainModel]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.separatorStyle = .None
    }
    
    //MARK:  AlbumListViewInput
    
    func update(withData data: [AlbumsDomainModel]) {
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


    // MARK: Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let data = data {
            return data.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! AlbumCell
        
        cell.titelAlbum.text = data![indexPath.row].title!
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
        
        selectedAlbum = data![indexPath.row].photos
        output.albumDidSelect(selectedAlbum!)
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 20))
        footerView.backgroundColor = color_VK
        return footerView
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    // add operations to the download queue for photos in the table
    func startDownloadForRecord(photoDetails: AlbumsDomainModel, indexPath: NSIndexPath){
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

