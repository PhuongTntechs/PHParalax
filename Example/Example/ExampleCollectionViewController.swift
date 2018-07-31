//
//  ExampleCollectionViewController.swift
//  Example
//
//  Created by phuongpro Imac on 7/31/18.
//  Copyright © 2018 phuongpro. All rights reserved.
//

import UIKit
import AVFoundation
import PHParalax

class ExampleCollectionViewController: UICollectionViewController {
    
    
    var photos = Photo.allPhotos()
    
    private var numberOfcolums: Int = 2
    private var padding: CGFloat = 4
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }

        collectionView?.backgroundColor = UIColor.clear
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
        
        
        // Set the PinterestLayout delegate
        if let layout = collectionView?.collectionViewLayout as? PHParalaxFlowLayout {
            layout.delegate = self
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exampleCell", for: indexPath)
        if let annotateCell = cell as? ExampleCollectionViewCell {
            annotateCell.photo = photos[indexPath.item]
        }
    
        return cell
    }

}

extension ExampleCollectionViewController: PHParalaxFlowLayoutDelegate {
    var numberOfColumns: Int {
        get {
            return numberOfcolums
        }
    }
    
    var paddingForCell: CGFloat {
        get {
            return padding
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return photos[indexPath.item].image.size.height
    }
    
    
}









