//
//  LoginViewUI+Extension.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

extension LoginViewController {
    
    func setupUI() {
        
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
        
        contentView.addSubview(titleView)
        contentView.addSubview(loginCardView)
        
        titleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        
        loginCardView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32).isActive = true
        loginCardView.heightAnchor.constraint(equalToConstant: 322).isActive = true
        loginCardView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        loginCardView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 24).isActive = true
        
        loginCardView.addSubview(signInTitle)
        loginCardView.addSubview(signInDivider)
        loginCardView.addSubview(emailLabel)
        loginCardView.addSubview(emailField)
        loginCardView.addSubview(passwordHeader)
        loginCardView.addSubview(passwordField)
        loginCardView.addSubview(signInButton)
        
        signInTitle.leftAnchor.constraint(equalTo: loginCardView.leftAnchor, constant: 16).isActive = true
        signInTitle.topAnchor.constraint(equalTo: loginCardView.topAnchor, constant: 16).isActive = true
        
        signInDivider.widthAnchor.constraint(equalTo: loginCardView.widthAnchor).isActive = true
        signInDivider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        signInDivider.centerXAnchor.constraint(equalTo: loginCardView.centerXAnchor).isActive = true
        signInDivider.topAnchor.constraint(equalTo: signInTitle.bottomAnchor, constant: 16).isActive = true
        
        emailLabel.leftAnchor.constraint(equalTo: loginCardView.leftAnchor, constant: 16).isActive = true
        emailLabel.topAnchor.constraint(equalTo: signInDivider.bottomAnchor, constant: 16).isActive = true
        
        emailField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8).isActive = true
        emailField.centerXAnchor.constraint(equalTo: loginCardView.centerXAnchor).isActive = true
        emailField.widthAnchor.constraint(equalTo: loginCardView.widthAnchor, constant: -32).isActive = true
        
        passwordHeader.leftAnchor.constraint(equalTo: loginCardView.leftAnchor, constant: 16).isActive = true
        passwordHeader.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 16).isActive = true
        
        passwordField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordField.topAnchor.constraint(equalTo: passwordHeader.bottomAnchor, constant: 8).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: loginCardView.centerXAnchor).isActive = true
        passwordField.widthAnchor.constraint(equalTo: loginCardView.widthAnchor, constant: -32).isActive = true
        
        signInButton.widthAnchor.constraint(equalTo: loginCardView.widthAnchor, constant: -32).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: loginCardView.centerXAnchor).isActive = true
        signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInButton.addTarget(self, action: #selector(loginUser(_:)), for: .touchUpInside)
    }
    
    @IBAction func loginUser(_ sender: UIButton) {
        resignFirstResponder()
        handleUserLogin()
    }
    
    func handleUserLogin() {
        
        // Validate user information
        guard let email = emailField.text, email.count > 0 else {
            self.showAlert("Login", body: "Invalid email")
            return
        }
        
        guard let password = passwordField.text, password.count > 0 else {
            self.showAlert("Login", body: "Invalid password")
            return
        }
        
        // Show loader
        self.showLoader(true)
        
        // Collect user information
        let userInfo = User(id: UUID(), email: email)
        
        // Save user information
        UserDefaults().setUserInformation(userInfo)
        
        // Fake a loader
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] (timer) in
            self?.showLoader(false)
            let homeController = HomeViewController()
            let nav = BaseNavigationController(rootViewController: homeController)
            UIApplication.shared.keyWindow?.rootViewController = nav
        }
    }
    
    private func showLoader(_ status: Bool) {
        UIView.animate(withDuration: 0.5) { Loader.sharedInstance.genericInitialze(show: status) }
    }
}
