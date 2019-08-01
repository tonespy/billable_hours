//
//  HomeViewController.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var contentTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let refreshControl = UIRefreshControl()
    
    var periods: [UserTimetable] = []
    
    struct Constants {
        static let SCREEN_TITLE = "Binance Law"
        static let TABLE_VIEW_ID = "main_table_view_identifier"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchPeriods()
    }
    
    func fetchPeriods() {
        self.periods = UserDefaults().getAllActivities()
        self.contentTableView.reloadData()
    }
}
