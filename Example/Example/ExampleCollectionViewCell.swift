//
//  ExampleCollectionViewCell.swift
//  Example
//
//  Created by phuongpro Imac on 7/31/18.
//  Copyright © 2018 phuongpro. All rights reserved.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblOne: UILabel!
    @IBOutlet weak var lblTwo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
    }
    
    var photo: Photo? {
        didSet {
            if let photo = photo {
                imgView.image = photo.image
                lblOne.text = photo.caption
                lblTwo.text = photo.comment
            }
        }
    }
}
