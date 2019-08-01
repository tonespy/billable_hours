//
//  HomeViewUI+Extension.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func setupUI() {
        
        view.backgroundColor = .appBackGround
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(logBillableHours))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOutUser))
        
        title = Constants.SCREEN_TITLE
        view.addSubview(contentTableView)
        
        if #available(iOS 11.0, *) {
            contentTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            contentTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            contentTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            contentTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        contentTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentTableView.register(EmployeePeriodCell.self, forCellReuseIdentifier: Constants.TABLE_VIEW_ID)
    }
    
    @objc func logBillableHours() {
        let billableHours = BillableHoursViewController()
        self.navigationController?.pushViewController(billableHours, animated: true)
    }
    
    @objc func logOutUser() {
        UserDefaults().logoutActiveUser()
        let loginController = LoginViewController()
        UIApplication.shared.keyWindow?.rootViewController = loginController
    }
}
