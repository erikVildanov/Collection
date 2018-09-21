//
//  CarViewCell.swift
//  Collections
//
//  Created by Erik Vildanov on 13.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    
    var image = UIImageView()
    var labelImg = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeView() {
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        labelImg.font = UIFont.systemFont(ofSize: 15)
        labelImg.translatesAutoresizingMaskIntoConstraints = false
        labelImg.textAlignment = .center
        
        let views = ["image": image, "labelImg": labelImg]
        addSubview(image)
        addSubview(labelImg)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[image]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[labelImg]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[image][labelImg(15)]|", options: [], metrics: nil, views: views))
    }
        
}
