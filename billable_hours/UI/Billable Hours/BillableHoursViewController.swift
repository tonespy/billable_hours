//
//  BillableHoursViewController.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

class BillableHoursViewController: UIViewController {
    
    let contentScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.showsVerticalScrollIndicator = false
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let billCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.elevate(elevation: 0.5)
        view.layer.cornerRadius = 6
        return view
    }()
    
    let projectNameHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemMedium(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.text = "Project"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let projectName: UITextField = {
        let field = UITextField()
        field.font = UIFont.mySystemRegular(ofSize: 16)
        field.setupDefaultTextFieldConfig()
        field.addLeftRightPadding(ofSize: 16)
        field.textColor = UIColor.darkGray
        field.autocorrectionType = .no
        field.autocapitalizationType = .words
        field.returnKeyType = .next
        field.tag = 0
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let rateHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemMedium(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.text = "Billable Rate $(per hour)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rateTextField: QuantityTextField = {
        let textfield = QuantityTextField()
        textfield.incrementValue = 100
        textfield.defaultValue = 100
        textfield.hasMin = true
        textfield.minValue = 100
        textfield.customaryUnit = " / hr"
        textfield.keyboardType = .numberPad
        textfield.returnKeyType = .next
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let datePickerHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemMedium(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.text = "Date"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let datePickerField: UITextField = {
        let field = UITextField()
        field.layer.borderColor = UIColor.appViewBorderColor.cgColor
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 6
        field.font = UIFont.systemFont(ofSize: 15)
        field.backgroundColor = .white
        field.textAlignment = .left
        field.textColor = UIColor.darkGray
        field.returnKeyType = .next
        
        // Left Image
        let image = #imageLiteral(resourceName: "booked_date_icon")
        let size = CGSize(width: 15, height: 16)
        let iconImage = UIImageView(image: image)
        iconImage.tintColor = UIColor.appViewBorderColor
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        field.addSubview(iconImage)
        iconImage.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        iconImage.leftAnchor.constraint(equalTo: field.leftAnchor, constant: 16).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: field.centerYAnchor).isActive = true
        
        // Left padding
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        mainView.backgroundColor = .clear
        field.leftView = mainView
        field.leftViewMode = .always
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let startTimeHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemMedium(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.text = "Start Time"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startTimeField: UITextField = {
        let field = UITextField()
        field.layer.borderColor = UIColor.appViewBorderColor.cgColor
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 6
        field.font = UIFont.systemFont(ofSize: 15)
        field.backgroundColor = .white
        field.textAlignment = .left
        field.textColor = UIColor.darkGray
        field.returnKeyType = .next
        
        // Left Image
        let image = #imageLiteral(resourceName: "booked_date_icon")
        let size = CGSize(width: 15, height: 16)
        let iconImage = UIImageView(image: image)
        iconImage.tintColor = UIColor.appViewBorderColor
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        field.addSubview(iconImage)
        iconImage.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        iconImage.leftAnchor.constraint(equalTo: field.leftAnchor, constant: 16).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: field.centerYAnchor).isActive = true
        
        // Left padding
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        mainView.backgroundColor = .clear
        field.leftView = mainView
        field.leftViewMode = .always
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let endTimeHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemMedium(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.text = "End Time"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let endTimeField: UITextField = {
        let field = UITextField()
        field.layer.borderColor = UIColor.appViewBorderColor.cgColor
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 6
        field.font = UIFont.systemFont(ofSize: 15)
        field.backgroundColor = .white
        field.textAlignment = .left
        field.textColor = UIColor.darkGray
        field.returnKeyType = .next
        
        // Left Image
        let image = #imageLiteral(resourceName: "booked_date_icon")
        let size = CGSize(width: 15, height: 16)
        let iconImage = UIImageView(image: image)
        iconImage.tintColor = UIColor.appViewBorderColor
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        field.addSubview(iconImage)
        iconImage.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        iconImage.leftAnchor.constraint(equalTo: field.leftAnchor, constant: 16).isActive = true
        iconImage.centerYAnchor.constraint(equalTo: field.centerYAnchor).isActive = true
        
        // Left padding
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        mainView.backgroundColor = .clear
        field.leftView = mainView
        field.leftViewMode = .always
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let logActivity: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.mySystemSemiBold(ofSize: 17)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.appBackGround
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cancelActivity: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.mySystemBold(ofSize: 15)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor(red:0.89, green:0.41, blue:0.30, alpha:1.0), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var currentActivity: UserTimetable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        prefillFields()
    }
    
    func prefillFields() {
        guard let currentActivity = currentActivity else { return }
        self.projectName.text = currentActivity.projectName
        
        let billRate = Int(currentActivity.billableRate)
        rateTextField.setQuantity(value: "\(billRate)")
        
        self.datePickerField.text = currentActivity.date.fullDate()
        if let datepicker = self.datePickerField.inputView as? UIDatePicker { datepicker.date = currentActivity.date }
        
        self.startTimeField.text = currentActivity.startTime.getFullTime()
        if let datepicker = self.startTimeField.inputView as? UIDatePicker { datepicker.date = currentActivity.startTime }
        
        self.endTimeField.text = currentActivity.endTime.getFullTime()
        if let datepicker = self.endTimeField.inputView as? UIDatePicker { datepicker.date = currentActivity.endTime }
    }
}
