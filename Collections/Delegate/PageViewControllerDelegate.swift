//
//  PageViewControllerDelegate.swift
//  Collections
//
//  Created by Erik Vildanov on 20.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

class PageViewControllerDelegate: NSObject, UIScrollViewDelegate {
    
    var startOffset = CGFloat(0)
    
    var delegate: MoveLineAnimationProtocol?
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOffset = scrollView.contentOffset.x
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let positionFromStartOfCurrentPage = startOffset - scrollView.contentOffset.x
        let percent = positionFromStartOfCurrentPage / UIScreen.main.bounds.width
        if percent != 0 {
            delegate?.moveLine(prosent: percent)
        }
    }
}
