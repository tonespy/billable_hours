//
//  UIFont+Extension.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 29/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

extension UIFont {
    
    @objc class func mySystemUltraLight(ofSize size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.ultraLight)
    }
    
    @objc class func mySystemThin(ofSize size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.thin)
    }
    
    @objc class func mySystemLight(ofSize size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.light)
    }
    
    @objc class func mySystemRegular(ofSize size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
    }
    
    @objc class func mySystemMedium(ofSize size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
    }
    
    @objc class func mySystemSemiBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.semibold)
    }
    
    @objc class func mySystemBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
    }
    
    @objc class func mySystemHeavy(ofSize size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.heavy)
    }
    
    @objc class func mySystemBlack(ofSize size: CGFloat) -> UIFont? {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.black)
    }
}
