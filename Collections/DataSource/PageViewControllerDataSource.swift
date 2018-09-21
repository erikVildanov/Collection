//
//  PageViewControllerDataSource.swift
//  Collections
//
//  Created by Erik Vildanov on 13.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

class PageViewControllerDataSource: NSObject, UIPageViewControllerDataSource {
    
    private var _index: Int!
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if (index == NSNotFound) {
            return nil
        }
        index += 1
        if (index == PAGES.count) {
            return nil
        }
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index: index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return PAGES.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func viewControllerAtIndex(index: Int) -> ContentViewController {
        if (PAGES.count == 0) || (index >= PAGES.count) {
            return ContentViewController()
        }
        let vc = ContentViewController()
        vc.pageIndex = index
        _index = index
        return vc
    }

}
