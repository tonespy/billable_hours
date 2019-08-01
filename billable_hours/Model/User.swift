//
//  User.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let id: UUID
    let email: String
    
    init(id: UUID, email: String) {
        self.id = id
        self.email = email
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
    }
}
