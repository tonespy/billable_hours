//
//  LoginViewController.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 29/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
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
    
    let titleView: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemBold(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        label.text = Constants.APP_TITLE
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.elevate(elevation: 0.5)
        view.layer.cornerRadius = 6
        return view
    }()
    
    let signInTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemSemiBold(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.text = Constants.BINANCE_SIGN_IN_TITLE
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let signInDivider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appViewBorderColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemMedium(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.text = Constants.EMAIL_TITLE
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailField: UITextField = {
        let field = UITextField()
        field.font = UIFont.mySystemRegular(ofSize: 16)
        field.setupDefaultTextFieldConfig()
        field.addLeftRightPadding(ofSize: 16)
        field.textColor = UIColor.darkGray
        field.autocorrectionType = .no
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        field.returnKeyType = .next
        field.delegate = self
        field.tag = 0
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let passwordHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemMedium(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.text = Constants.PASSWORD_TITLE
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordField: BillableHoursPasswordField = {
        let field = BillableHoursPasswordField()
        field.font = UIFont.mySystemRegular(ofSize: 16)
        field.setupDefaultTextFieldConfig()
        field.textColor = UIColor.darkGray
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .done
        field.delegate = self
        field.tag = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.SIGN_IN_TITLE, for: .normal)
        button.titleLabel?.font = UIFont.mySystemSemiBold(ofSize: 17)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.appBackGround
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    struct Constants {
        static let EMAIL_TITLE = "Email"
        static let PASSWORD_TITLE = "Password"
        static let SIGN_IN_TITLE = "Sign in with Binance"
        static let APP_TITLE = "Binance Law"
        static let BINANCE_SIGN_IN_TITLE = "Sign in with your Binance account"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}
