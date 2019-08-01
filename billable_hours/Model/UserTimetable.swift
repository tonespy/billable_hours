//
//  UserTimetable.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import Foundation

struct UserTimetable: Codable {
    
    let id: UUID
    let billableRate: Float
    let projectName: String
    let date: Date
    let startTime: Date
    let endTime: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case billableRate = "billable_rate"
        case projectName = "project_name"
        case date = "date"
        case startTime = "start_time"
        case endTime = "end_time"
    }
}
