//
//  ContentViewControllerDelegate.swift
//  Collections
//
//  Created by Erik Vildanov on 16.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

class ContentViewControllerDelegate: NSObject , UIViewControllerPreviewingDelegate {
    
    var collectionView: ImageViewCollection!

    var delegate: PushViewProtocol?
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let sourceView = previewingContext.sourceView
        guard let indexPath = collectionView.collection.indexPathForSubview(sourceView) else {return nil}
        let cell = collectionView.collection.cellForItem(at: indexPath) as! ImageViewCell
        let detailVC = DetailViewController()
        detailVC.detailView.imageView.image = cell.image.image
        guard let size = cell.image.image?.size else { return nil }
        detailVC.preferredContentSize = resizeView(imageSize: size)
        previewingContext.sourceRect = sourceView.bounds
        
        return detailVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        delegate?.push(viewControllerToCommit, animated: true)
    }
    
    private func resizeView(imageSize: CGSize) -> CGSize{
        let newWidth: CGFloat = 310
        let newHeight = (imageSize.height / imageSize.width) * newWidth;
        return CGSize(width: newWidth, height: newHeight)
    }
    
}
