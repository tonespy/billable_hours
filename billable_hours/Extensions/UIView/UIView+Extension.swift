//
//  UIView+Extension.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

extension UIView {
    
    func elevate(elevation: Double) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = CGFloat(elevation)
        self.layer.shadowOpacity = 0.24
    }
    
    func statusBarView() -> UIView {
        let view = UIView(frame: UIApplication.shared.statusBarFrame)
        view.backgroundColor = UIColor.appBackGround.withAlphaComponent(0.01)
        return view
    }
}
