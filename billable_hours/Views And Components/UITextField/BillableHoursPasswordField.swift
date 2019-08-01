//
//  BillableHoursPasswordField.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

class BillableHoursPasswordField: BaseTextField {
    
    let rightViewBtn: UIButton = {
        let button = UIButton()
        button.setTitle("SHOW", for: .normal)
        button.setTitle("HIDE", for: .selected)
        button.setTitleColor(UIColor.passwordToggleTitleColor, for: .normal)
        button.titleLabel?.font = UIFont.mySystemRegular(ofSize: 11)
        button.backgroundColor = .clear
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        self.font = UIFont.mySystemRegular(ofSize: 16)
        self.textColor = UIColor.darkGray
        self.autocorrectionType = .no
        self.isSecureTextEntry = true
        self.setupDefaultTextFieldConfig()
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        self.leftView = leftPadding
        self.leftViewMode = .always
        rightViewBtn.addTarget(self, action: #selector(hideToggle(_:)), for: .touchUpInside)
        self.rightView = rightViewBtn
        self.rightViewMode = .always
    }
    
    @IBAction func hideToggle(_ sender: UIButton) {
        self.togglePasswordVisibility()
        sender.isSelected = !self.isSecureTextEntry
    }
}
