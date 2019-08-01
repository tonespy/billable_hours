//
//  UserDefault+Extension.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 31/07/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import Foundation

struct UserDefaultKeys {
    
    private static let DEFAULT_ID = "com.tonespy.billable-hours"
    
    // User key
    static let USER_INFORMATION = DEFAULT_ID+".user_information"
    // Activity key
    static let ACTIVITY_INFORMATION = DEFAULT_ID+".activity_information"
}

extension UserDefaults {
    
    //MARK: - User information
    func setUserInformation(_ user: User) {
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(user) {
            set(encoded, forKey: UserDefaultKeys.USER_INFORMATION)
        }
    }
    
    func getUserInformation() -> User? {
        if let mainData = value(forKey: UserDefaultKeys.USER_INFORMATION) as? Data {
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User.self, from: mainData) { return savedUser }
        }
        
        return nil
    }
    
    //MARK: - Save activity information
    func saveActivity(_ activities: [UserTimetable]) {
        let allActivities = getAllActivities() + activities
        
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(allActivities) {
            set(encoded, forKey: UserDefaultKeys.ACTIVITY_INFORMATION)
        }
    }
    
    //MARK: - Get all activities
    func getAllActivities() -> [UserTimetable] {
        
        if let mainData = value(forKey: UserDefaultKeys.ACTIVITY_INFORMATION) as? Data {
            let decoder = JSONDecoder()
            if let savedActivities = try? decoder.decode([UserTimetable].self, from: mainData) { return savedActivities }
        }
        
        return []
    }
    
    //MARK: - Delete activity information
    func deleteActivity(_ activity: UserTimetable) {
        let allActivities = getAllActivities().filter { $0.id != activity.id }
        
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(allActivities) {
            set(encoded, forKey: UserDefaultKeys.ACTIVITY_INFORMATION)
        }
    }
    
    //MARK: - Update activity information
    func updateActivity(_ activity: UserTimetable) {
        var allActivities = getAllActivities().filter { $0.id != activity.id }
        allActivities.append(activity)
        
        let encoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(allActivities) {
            set(encoded, forKey: UserDefaultKeys.ACTIVITY_INFORMATION)
        }
    }
    
    //MARK: - Clear user data
    func logoutActiveUser() {
        if let bundleName = Bundle.main.bundleIdentifier {
            removePersistentDomain(forName: bundleName)
        }
    }
}
