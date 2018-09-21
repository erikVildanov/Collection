//
//  ContentViewControllerDataSource.swift
//  Collections
//
//  Created by Erik Vildanov on 16.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

class ContentViewControllerDataSource: NSObject ,UICollectionViewDataSource {
    
    var imageLbl: String!
    var imageUrl: [String]!
    var delegate: SourceViewProtocol?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ImageViewCell
        
        myCell.image.isUserInteractionEnabled = true
        self.delegate?.pegister(soudceView: myCell.image)
        
        ImageLoader.sharedLoader.imageForUrl(urlString: imageUrl[indexPath.row]) { (image, url) -> () in
            myCell.image.image = image
        }
        
        myCell.labelImg.text = imageLbl + " \(indexPath.row)"
        
        let rect = myCell.frame
        myCell.frame.origin.x = myCell.frame.origin.x + 200
        
        let time = TimeInterval(indexPath.row/3)
        
        UIView.animate(withDuration: 1.5 , delay: 0.1 * time , usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { () -> Void in
            myCell.frame = rect
        }, completion: nil)
        
        return myCell
    }
    
}
