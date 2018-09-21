//
//  DetailViewController.swift
//  Collections
//
//  Created by Erik Vildanov on 19.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
    }

}
