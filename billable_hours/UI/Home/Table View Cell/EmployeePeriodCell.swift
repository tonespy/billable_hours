//
//  EmployeePeriodCell.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

class EmployeePeriodCell: BaseTableViewCell {
    
    let holderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.elevate(elevation: 0.5)
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let badgeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let abbreviationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemBold(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let clientName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.mySystemSemiBold(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let toBillHours: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemMedium(ofSize: 13)
        label.textColor = UIColor.subtitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let toBillDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.mySystemMedium(ofSize: 13)
        label.textColor = UIColor.subtitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var activity: UserTimetable? {
        didSet {
            guard let activity = activity else { return }
            if let first = activity.projectName.first {
                self.abbreviationLabel.text = String(first).capitalized
            }
            
            self.clientName.text = activity.projectName
            
            let startAndEnd = "\(activity.startTime.getFullTime())  ——  \(activity.endTime.getFullTime())"
            
            toBillHours.text = startAndEnd
            
            toBillDate.text = activity.date.fullDate()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .clear
        addSubview(holderView)
        
        holderView.widthAnchor.constraint(equalTo: widthAnchor, constant: -32).isActive = true
        holderView.heightAnchor.constraint(equalTo: heightAnchor, constant: -12).isActive = true
        holderView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        holderView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        // Badge
        holderView.addSubview(badgeView)
        // Bill Hours
        holderView.addSubview(toBillHours)
        // Client Name
        holderView.addSubview(clientName)
        // Bill Date
        holderView.addSubview(toBillDate)
        
        // Badge
        badgeView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        badgeView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        badgeView.centerYAnchor.constraint(equalTo: holderView.centerYAnchor).isActive = true
        badgeView.leftAnchor.constraint(equalTo: holderView.leftAnchor, constant: 16).isActive = true
        badgeView.addSubview(abbreviationLabel)
        
        abbreviationLabel.centerXAnchor.constraint(equalTo: badgeView.centerXAnchor).isActive = true
        abbreviationLabel.centerYAnchor.constraint(equalTo: badgeView.centerYAnchor).isActive = true
        
        // Bill hours
        toBillHours.leftAnchor.constraint(equalTo: badgeView.rightAnchor, constant: 16).isActive = true
        toBillHours.centerYAnchor.constraint(equalTo: badgeView.centerYAnchor).isActive = true
        toBillHours.rightAnchor.constraint(equalTo: holderView.rightAnchor, constant: -16).isActive = true
        
        // Client name
        clientName.leftAnchor.constraint(equalTo: badgeView.rightAnchor, constant: 16).isActive = true
        clientName.bottomAnchor.constraint(equalTo: toBillHours.topAnchor, constant: -6).isActive = true
        clientName.rightAnchor.constraint(equalTo: holderView.rightAnchor, constant: -16).isActive = true
        
        // Bill date
        toBillDate.leftAnchor.constraint(equalTo: badgeView.rightAnchor, constant: 16).isActive = true
        toBillDate.topAnchor.constraint(equalTo: toBillHours.bottomAnchor, constant: 6).isActive = true
        toBillDate.rightAnchor.constraint(equalTo: holderView.rightAnchor, constant: -16).isActive = true
    }
}
