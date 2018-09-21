//
//  ViewController.swift
//  Collections
//
//  Created by Erik Vildanov on 13.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var pageViewController: UIPageViewController!
    private let pageViewControllerDataSource = PageViewControllerDataSource()
    private let pageViewControllerDelegate = PageViewControllerDelegate()
    private let labelView = LabelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.title = "Collection"
        
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.dataSource = pageViewControllerDataSource
        pageViewControllerDelegate.delegate = labelView.self
        self.pageViewController.setViewControllers([pageViewControllerDataSource.viewControllerAtIndex(index: 0)],
                                                   direction: .reverse, animated: true, completion: nil)
        self.addChild(self.pageViewController)
        
        
        let views = [
            "pg": self.pageViewController.view!,
            "labelView": labelView,
            ]
        
        for (_, v) in views {
            v.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(v)
        }
        NSLayoutConstraint.activate(
            [NSLayoutConstraint(
                item: labelView,
                attribute: .left,
                relatedBy: .equal,
                toItem: self.view,
                attribute: .left,
                multiplier: 1,
                constant: 0),
             ] +
                NSLayoutConstraint.constraints(withVisualFormat: "H:|[pg]|",options: .alignAllCenterX, metrics: [:], views: views) +
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-[labelView(30)]-[pg]-|", options: .alignAllCenterX, metrics: [:], views: views)
        )
        self.pageViewController.didMove(toParent: self)
        
        findScrollView()
    }
    
    private func findScrollView(){
        for v in pageViewController.view.subviews {
            if v is UIScrollView {
                (v as! UIScrollView).delegate = pageViewControllerDelegate
            }
        }
    }
}



