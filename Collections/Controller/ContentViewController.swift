//
//  CarViewController.swift
//  Collections
//
//  Created by Erik Vildanov on 13.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, PushViewProtocol, SourceViewProtocol {
    
    var pageIndex: Int!
    
    let collectionDataSource = ContentViewControllerDataSource()
    let collectionDelegate = ContentViewControllerDelegate()
    var collectionView = ImageViewCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionDataSource.imageUrl = PAGES[pageIndex].image
        collectionDataSource.imageLbl = PAGES[pageIndex].title
        collectionDataSource.delegate = self
        collectionDelegate.collectionView = collectionView
        collectionDelegate.delegate = self
        collectionView.collection.dataSource = collectionDataSource
        collectionView.collection.register(ImageViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
        self.view = collectionView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.animationCell(pageIndex: pageIndex)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            print("Touch Move")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func push(_ viewControllerToPush: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewControllerToPush, animated: animated)
    }
    
    func pegister(soudceView: UIView) {
        registerForPreviewing(with: collectionDelegate, sourceView: soudceView)
    }
    
}
