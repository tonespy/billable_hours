//
//  UITextField+Extension.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setupDefaultTextFieldConfig() {
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.appViewBorderColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.2)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 0.3
    }
    
    func addLeftRightPadding(ofSize size: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    // Courtesy: Stackoverflow
    // Url: https://stackoverflow.com/a/48115361
    // User: https://stackoverflow.com/users/368674/zath
    func togglePasswordVisibility() {
        isSecureTextEntry = !isSecureTextEntry
        
        if let existingText = text, isSecureTextEntry {
            /* When toggling to secure text, all text will be purged if the user
             continues typing unless we intervene. This is prevented by first
             deleting the existing text and then recovering the original text. */
            deleteBackward()
            
            if let textRange = textRange(from: beginningOfDocument, to: endOfDocument) {
                replace(textRange, withText: existingText)
            }
        }
        
        /* Reset the selected text range since the cursor can end up in the wrong
         position after a toggle because the text might vary in width */
        if let existingSelectedTextRange = selectedTextRange {
            selectedTextRange = nil
            selectedTextRange = existingSelectedTextRange
        }
    }
    
    func addInputViewDatePicker(datePickerMode: UIDatePicker.Mode, target: Any, selector: Selector) {
        
        self.tintColor = .clear
        
        // Set Default Date
        if datePickerMode == .date {
            self.text = Date().fullDate()
        } else if datePickerMode == .dateAndTime {
            self.text = Date().getDateTime()
        } else if datePickerMode == .time {
            self.text = Date().getFullTime()
        }
        
        let screenWidth = UIScreen.main.bounds.width
        
        //Add DatePicker as inputView
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        datePicker.datePickerMode = datePickerMode
        datePicker.timeZone = TimeZone(secondsFromGMT: 0)
        datePicker.addTarget(self, action: #selector(dateValueChanged(_:)), for: .valueChanged)
        self.inputView = datePicker
        
        //Add Tool Bar as input AccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        toolBar.setItems([flexibleSpace, doneBarButton], animated: false)
        
        self.inputAccessoryView = toolBar
    }
    
    @objc func dateValueChanged(_ sender: UIDatePicker) {
        if sender.datePickerMode == .date {
            self.text = sender.date.fullDate()
        } else if sender.datePickerMode == .dateAndTime {
            self.text = sender.date.getDateTime()
        } else if sender.datePickerMode == .time {
            self.text = sender.date.getFullTime()
        }
    }
    
    @objc func cancelPressed() {
        self.resignFirstResponder()
    }
}
