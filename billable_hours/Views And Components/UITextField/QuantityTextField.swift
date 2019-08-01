//
//  QuantityTextField.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 01/08/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

class QuantityTextField: UITextField, UITextFieldDelegate {
    
    let positiveBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "quantity_increment_up"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let negativeBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "quantity_increment_down"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let leftdivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.9, green:0.91, blue:0.92, alpha:1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rightdivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.9, green:0.91, blue:0.92, alpha:1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let measuringIdentifier: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemRegular(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var minValue: Int?
    var maxValue: Int?
    var defaultValue: Int? {
        didSet {
            guard let defaultValue = defaultValue else { return }
            setQuantity(value: "\(defaultValue)")
        }
    }
    var incrementValue: Int?
    var previousValue: Int?
    var hasMin = false
    var customaryUnit = " / hr" {
        didSet {
            measuringIdentifier.text = customaryUnit
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        
        self.autocorrectionType = .no
        self.setupDefaultTextFieldConfig()
        let mainLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 63, height: 1))
        self.leftView = mainLeftView
        self.leftViewMode = .always
        
        let mainRightView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 1))
        self.rightView = mainRightView
        self.rightViewMode = .always
        
        self.backgroundColor = .white
        self.addSubview(negativeBtn)
        self.addSubview(leftdivider)
        self.addSubview(positiveBtn)
        self.addSubview(rightdivider)
        self.addSubview(measuringIdentifier)
        
        negativeBtn.widthAnchor.constraint(equalToConstant: 55).isActive = true
        negativeBtn.heightAnchor.constraint(equalToConstant: 55).isActive = true
        negativeBtn.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        negativeBtn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        negativeBtn.addTarget(self, action: #selector(decreaseAmount(_:)), for: .touchUpInside)
        
        leftdivider.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        leftdivider.leftAnchor.constraint(equalTo: negativeBtn.rightAnchor).isActive = true
        leftdivider.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        leftdivider.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        positiveBtn.widthAnchor.constraint(equalToConstant: 55).isActive = true
        positiveBtn.heightAnchor.constraint(equalToConstant: 55).isActive = true
        positiveBtn.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        positiveBtn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        positiveBtn.addTarget(self, action: #selector(increaseAmount(_:)), for: .touchUpInside)
        
        rightdivider.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        rightdivider.rightAnchor.constraint(equalTo: positiveBtn.leftAnchor).isActive = true
        rightdivider.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rightdivider.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        measuringIdentifier.rightAnchor.constraint(equalTo: rightdivider.leftAnchor, constant: -8).isActive = true
        measuringIdentifier.centerYAnchor.constraint(equalTo: rightdivider.centerYAnchor).isActive = true
        measuringIdentifier.text = customaryUnit
        if let defaultValue = defaultValue {
            setupFormattedNumber(withValue: NSNumber(value: defaultValue), textField: self)
        } else if let minValue = minValue {
            setupFormattedNumber(withValue: NSNumber(value: minValue), textField: self)
        }
        
        self.addTarget(self, action: #selector(textEditChange(_:)), for: .editingChanged)
    }
    
    @objc func textEditChange(_ textField: UITextField) {
        let value = textField.text ?? ""
        
        let numberWithOutCommas = value.replacingOccurrences(of: ",", with: "")
        let isNumeric = isNumberNumeric(withValue: numberWithOutCommas)
        
        if isNumeric {
            let formatter = numberFormatter()
            let number = formatter.number(from: numberWithOutCommas)
            if number != nil {
                
                let calcValue = number!.intValue
                let number = NSNumber(value: calcValue)
                setupFormattedNumber(withValue: number, textField: self)
            } else {
                textField.text = nil
            }
        }
    }
    
    func setQuantity(value: String) {
        let isNumeric = isNumberNumeric(withValue: value)
        if isNumeric {
            let formatter = numberFormatter()
            let numberWithOutCommas = value.replacingOccurrences(of: ",", with: "")
            let number = formatter.number(from: numberWithOutCommas)
            if let number = number {
                let formattedString = formatter.string(from: number)
                self.text = formattedString
            }
        }
        self.sendActions(for: .valueChanged)
    }
    
    private func setupFormattedNumber(withValue value: NSNumber, textField: UITextField) {
        let formatter = numberFormatter()
        let formattedString = formatter.string(from: value)
        self.previousValue = value.intValue
        self.text = formattedString
        self.sendActions(for: .valueChanged)
    }
    
    private func numberFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 8
        return formatter
    }
    
    private func isNumberNumeric(withValue value: String) -> Bool {
        return Int(value) != nil
    }
    
    @IBAction func increaseAmount(_ sender: UIButton) {
        increaseOrDecreaseValue(increase: true)
    }
    
    @IBAction func decreaseAmount(_ sender: UIButton) {
        increaseOrDecreaseValue(increase: false)
    }
    
    private func increaseOrDecreaseValue(increase: Bool) {
        let newValue = self.text ?? ""
        let isNumeric = isNumberNumeric(withValue: newValue.replacingOccurrences(of: ",", with: ""))
        
        if isNumeric {
            let formatter = numberFormatter()
            let numberWithOutCommas = newValue.replacingOccurrences(of: ",", with: "")
            let number = formatter.number(from: numberWithOutCommas)
            if let number = number {
                
                var calcValue = number.intValue
                if increase { calcValue += incrementValue ?? 1 }
                else {
                    if calcValue > 0 {
                        calcValue -= incrementValue ?? 1
                    } else { calcValue = 0 }
                }
                
                if let newMin = self.minValue, let newMax = self.maxValue {
                    if calcValue <= newMin {
                        let number = NSNumber(value: newMin)
                        setupFormattedNumber(withValue: number, textField: self)
                    } else if calcValue >= newMax {
                        let number = NSNumber(value: newMax)
                        setupFormattedNumber(withValue: number, textField: self)
                    } else {
                        let number = NSNumber(value: calcValue)
                        setupFormattedNumber(withValue: number, textField: self)
                    }
                } else if let newMin = self.minValue {
                    if calcValue <= newMin {
                        let number = NSNumber(value: newMin)
                        setupFormattedNumber(withValue: number, textField: self)
                    } else {
                        let number = NSNumber(value: calcValue)
                        setupFormattedNumber(withValue: number, textField: self)
                    }
                } else if let newMax = self.maxValue {
                    if calcValue >= newMax {
                        let number = NSNumber(value: newMax)
                        setupFormattedNumber(withValue: number, textField: self)
                    } else {
                        let number = NSNumber(value: calcValue)
                        setupFormattedNumber(withValue: number, textField: self)
                    }
                } else {
                    let number = NSNumber(value: calcValue)
                    setupFormattedNumber(withValue: number, textField: self)
                }
            } else { setupFormattedNumber(withValue: NSNumber(value: minValue ?? 0), textField: self) }
        } else { setupFormattedNumber(withValue: NSNumber(value: minValue ?? 0), textField: self) }
    }
}
