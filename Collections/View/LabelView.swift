//
//  PageView.swift
//  Collections
//
//  Created by Erik Vildanov on 19.09.2018.
//  Copyright © 2018 Erik Vildanov. All rights reserved.
//

import UIKit

class LabelView: UIView, MoveLineAnimationProtocol {

    let labelCar = UILabel()
    let labelHouse = UILabel()
    let lineView = UIView()

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

    private func initializeView(){
        
        labelCar.translatesAutoresizingMaskIntoConstraints = false
        labelHouse.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .red
        addSubview(labelCar)
        addSubview(labelHouse)
        addSubview(lineView)
        labelCar.text = "Cars"
        labelHouse.text = "House"
        
        self.labelCar.font = UIFont.boldSystemFont(ofSize: 20)
        
        labelCar.textAlignment = .center
        labelHouse.textAlignment = .center
        
        let views = ["labelCar": labelCar, "labelHouse": labelHouse, "lineView": lineView]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[labelCar(60)]-20-[labelHouse(60)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[labelCar(30)][lineView(5)]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[labelHouse(30)][lineView]", options: [], metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[lineView(60)]", options: [], metrics: nil, views: views))
    }
    
    func moveLine(prosent: CGFloat) {
        let x = 80 * prosent
        guard oldX - x >= 0 && oldX - x <= 80 else { return }

        if oldX == 0 {
            animation(tx: -x)
        } else {
            animation(tx: oldX - x)
        }
        
        if x == -80 {
            oldX = -x
        } else if oldX - x == 0 {
            oldX = 0
        }
    }
    
    private func animation(tx: CGFloat){
        UIView.animate(withDuration: 0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .allowUserInteraction, animations:{
            self.lineView.transform = CGAffineTransform.init(translationX: tx, y: 0)
            if tx == 0{
                self.labelCar.font = UIFont.boldSystemFont(ofSize: 20)
                self.labelHouse.font = UIFont.systemFont(ofSize: 16)
            } else if tx == 80 {
                self.labelHouse.font = UIFont.boldSystemFont(ofSize: 20)
                self.labelCar.font = UIFont.systemFont(ofSize: 16)
            }
        }, completion: nil)
    }
    
    
}
