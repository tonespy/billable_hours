//
//  UIViewController+Extension.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(_ title : String!, body : String!, showCancel : Bool = false, completion: (() -> Swift.Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: body, preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: { action in completion?() } ) )
        
        if showCancel {
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default,handler: { action in } ) )
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
}
