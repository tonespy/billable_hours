//
//  Loader.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

class Loader {
    static let sharedInstance = Loader()
    
    var loaderView : LoaderView!
    
    func showLoader() {
        hideLoader()
        var vc = UIApplication.shared.keyWindow?.rootViewController
        while let presentedViewController = vc!.presentedViewController {
            vc = presentedViewController
        }
        
        self.loaderView = LoaderView(frame: vc!.view.frame)
        vc!.view.addSubview(self.loaderView)
        vc!.view.bringSubviewToFront(self.loaderView)
    }
    
    func vcShowLoader(vc: UIViewController?) {
        self.loaderView = LoaderView(frame: vc!.view.frame)
        vc!.view.addSubview(self.loaderView)
        vc!.view.bringSubviewToFront(self.loaderView)
    }
    
    func hideLoader() {
        if loaderView != nil && loaderView.superview != nil {
            self.loaderView.removeFromSuperview()
        }
    }
    
    func isLoaderVisible() -> Bool {
        return loaderView != nil
    }
    
    func genericInitialze(show: Bool) {
        if show {
            showLoader()
        } else {
            hideLoader()
        }
    }
}
