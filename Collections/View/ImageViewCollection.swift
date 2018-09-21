//
//  CarView.swift
//  Collections
//
//  Created by Erik Vildanov on 13.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

//var oldPageIndex: Int = 0

class ImageViewCollection: UIView {

    var collection: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
        
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeView(){
        
        var widthCell = UIScreen.main.bounds.width * 0.25
        var heightCell = UIScreen.main.bounds.height * 0.22
        
        if UIDeviceOrientation.portrait.isLandscape {
            widthCell = UIScreen.main.bounds.height * 0.22
            heightCell = UIScreen.main.bounds.width * 0.25
        }

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: widthCell, height: heightCell)
        
        collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        backgroundColor = .white
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false

        let views = ["collection": collection!]
        
        addSubview(collection)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collection]|", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[collection]|", options: [], metrics: nil, views: views))
    }
    
    func animationCell(pageIndex: Int){

        let cells = collection.visibleCells
        var collectionWidth = collection.bounds.size.width

        if pageIndex < oldPageIndex {
            collectionWidth *= -1
        }

        oldPageIndex = pageIndex

        for cell in cells {
            let cell = cell as! ImageViewCell
            cell.transform = CGAffineTransform.init(translationX: collectionWidth, y: 0)
        }

        var index = 0
        for cell in cells {
            let cell = cell as! ImageViewCell
            UIView.animate(withDuration: 1, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .allowUserInteraction, animations:{
                cell.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }

    }

    
}
