//
//  BillableHoursUI+Extension.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

extension BillableHoursViewController {
    
    func setupUI() {
        
        title = "Bill"
        
        view.backgroundColor = .appBackGround
        
        view.addSubview(contentScrollView)
        if #available(iOS 11.0, *) {
            contentScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            contentScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            contentScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            contentScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        contentScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentScrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        contentScrollView.addSubview(contentView)
        contentView.heightAnchor.constraint(equalTo: contentScrollView.heightAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: contentScrollView.widthAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: contentScrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor).isActive = true
        
        contentView.addSubview(billCardView)
        
        billCardView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        billCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        billCardView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        billCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        
        billCardView.addSubview(projectNameHeader)
        billCardView.addSubview(projectName)
        billCardView.addSubview(rateHeader)
        billCardView.addSubview(rateTextField)
        billCardView.addSubview(datePickerHeader)
        billCardView.addSubview(datePickerField)
        billCardView.addSubview(startTimeHeader)
        billCardView.addSubview(startTimeField)
        billCardView.addSubview(endTimeField)
        billCardView.addSubview(endTimeHeader)
        billCardView.addSubview(logActivity)
        billCardView.addSubview(cancelActivity)
        
        projectNameHeader.widthAnchor.constraint(equalTo: billCardView.widthAnchor, constant: -32).isActive = true
        projectNameHeader.centerXAnchor.constraint(equalTo: billCardView.centerXAnchor).isActive = true
        projectNameHeader.topAnchor.constraint(equalTo: billCardView.topAnchor, constant: 16).isActive = true
        
        projectName.widthAnchor.constraint(equalTo: billCardView.widthAnchor, constant: -32).isActive = true
        projectName.centerXAnchor.constraint(equalTo: billCardView.centerXAnchor).isActive = true
        projectName.topAnchor.constraint(equalTo: projectNameHeader.bottomAnchor, constant: 8).isActive = true
        projectName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        rateHeader.widthAnchor.constraint(equalTo: billCardView.widthAnchor, constant: -32).isActive = true
        rateHeader.centerXAnchor.constraint(equalTo: billCardView.centerXAnchor).isActive = true
        rateHeader.topAnchor.constraint(equalTo: projectName.bottomAnchor, constant: 24).isActive = true
        
        rateTextField.widthAnchor.constraint(equalTo: billCardView.widthAnchor, constant: -32).isActive = true
        rateTextField.centerXAnchor.constraint(equalTo: billCardView.centerXAnchor).isActive = true
        rateTextField.topAnchor.constraint(equalTo: rateHeader.bottomAnchor, constant: 8).isActive = true
        rateTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        datePickerHeader.widthAnchor.constraint(equalTo: billCardView.widthAnchor, constant: -32).isActive = true
        datePickerHeader.centerXAnchor.constraint(equalTo: billCardView.centerXAnchor).isActive = true
        datePickerHeader.topAnchor.constraint(equalTo: rateTextField.bottomAnchor, constant: 24).isActive = true
        
        datePickerField.widthAnchor.constraint(equalTo: billCardView.widthAnchor, constant: -32).isActive = true
        datePickerField.centerXAnchor.constraint(equalTo: billCardView.centerXAnchor).isActive = true
        datePickerField.topAnchor.constraint(equalTo: datePickerHeader.bottomAnchor, constant: 8).isActive = true
        datePickerField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        datePickerField.addInputViewDatePicker(datePickerMode: .date, target: self, selector: #selector(didTapDateField))
        
        startTimeHeader.leftAnchor.constraint(equalTo: billCardView.leftAnchor, constant: 16).isActive = true
        startTimeHeader.topAnchor.constraint(equalTo: datePickerField.bottomAnchor, constant: 24).isActive = true
        
        startTimeField.widthAnchor.constraint(equalTo: billCardView.widthAnchor, multiplier: 1/2, constant: -24).isActive = true
        startTimeField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startTimeField.leftAnchor.constraint(equalTo: billCardView.leftAnchor, constant: 16).isActive = true
        startTimeField.topAnchor.constraint(equalTo: startTimeHeader.bottomAnchor, constant: 8).isActive = true
        startTimeField.addInputViewDatePicker(datePickerMode: .time, target: self, selector: #selector(didTapStartTimeField))
        
        endTimeField.widthAnchor.constraint(equalTo: billCardView.widthAnchor, multiplier: 1/2, constant: -24).isActive = true
        endTimeField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        endTimeField.rightAnchor.constraint(equalTo: billCardView.rightAnchor, constant: -16).isActive = true
        endTimeField.topAnchor.constraint(equalTo: startTimeField.topAnchor).isActive = true
        endTimeField.addInputViewDatePicker(datePickerMode: .time, target: self, selector: #selector(didTapEndTimeField))
        
        endTimeHeader.leftAnchor.constraint(equalTo: endTimeField.leftAnchor).isActive = true
        endTimeHeader.bottomAnchor.constraint(equalTo: endTimeField.topAnchor, constant: -8).isActive = true
        
        logActivity.widthAnchor.constraint(equalTo: billCardView.widthAnchor, constant: -32).isActive = true
        logActivity.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logActivity.centerXAnchor.constraint(equalTo: billCardView.centerXAnchor).isActive = true
        logActivity.topAnchor.constraint(equalTo: endTimeField.bottomAnchor, constant: 16).isActive = true
        logActivity.addTarget(self, action: #selector(createLog(_:)), for: .touchUpInside)
        
        cancelActivity.widthAnchor.constraint(equalTo: billCardView.widthAnchor, constant: -32).isActive = true
        cancelActivity.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cancelActivity.centerXAnchor.constraint(equalTo: billCardView.centerXAnchor).isActive = true
        cancelActivity.topAnchor.constraint(equalTo: logActivity.bottomAnchor, constant: 8).isActive = true
        cancelActivity.addTarget(self, action: #selector(cancelLog(_:)), for: .touchUpInside)
    }
    
    @IBAction func createLog(_ sender: UIButton) {
        guard let name = projectName.text, name.count > 0 else {
            self.showAlert("Bill", body: "Please provide a valid name")
            return
        }
        
        guard let rate = rateTextField.text, rate.count > 0 else {
            self.showAlert("Bill", body: "Please provide a valid rate")
            return
        }
        
        let actualText = rate.replacingOccurrences(of: ",", with: "")
        
        guard let actualRate = Float(actualText), actualRate >= 100 else {
            self.showAlert("Bill", body: "Please provide a valid rate")
            return
        }
        
        let datePicker = datePickerField.inputView as! UIDatePicker
        let startPicker = startTimeField.inputView as! UIDatePicker
        let endPicker = endTimeField.inputView as! UIDatePicker
        
        if startPicker.date.getFullTime() == endPicker.date.getFullTime() {
            self.showAlert("Bill", body: "Please pick a valid start and end time")
            return
        }
        
        if endPicker.date < startPicker.date {
            self.showAlert("Bill", body: "Please pick a valid start and end time")
            return
        }
        
        if let currentActivity = currentActivity {
            let updatedActivity = UserTimetable(id: currentActivity.id, billableRate: actualRate,
                                                projectName: name, date: datePicker.date, startTime: startPicker.date, endTime: endPicker.date)
            UserDefaults().updateActivity(updatedActivity)
        } else {
            let newActivity = UserTimetable(id: UUID(), billableRate: actualRate, projectName: name,
                                            date: datePicker.date, startTime: startPicker.date, endTime: endPicker.date)
            UserDefaults().saveActivity([newActivity])
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelLog(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapDateField() {
        if let datePicker = self.datePickerField.inputView as? UIDatePicker {
            self.datePickerField.text = datePicker.date.fullDate()
            self.datePickerField.resignFirstResponder()
        }
    }
    
    @objc func didTapStartTimeField() {
        if let datePicker = self.startTimeField.inputView as? UIDatePicker {
            self.startTimeField.text = datePicker.date.getFullTime()
            self.startTimeField.resignFirstResponder()
        }
    }
    
    @objc func didTapEndTimeField() {
        if let datePicker = self.endTimeField.inputView as? UIDatePicker {
            self.endTimeField.text = datePicker.date.getFullTime()
            self.endTimeField.resignFirstResponder()
        }
    }
}
