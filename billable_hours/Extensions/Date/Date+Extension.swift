//
//  Date+Extension.swift
//  billable_hours
//
//  Created by Abubakar Oladeji on 01/08/2019.
//  Copyright © 2019 Tonespy. All rights reserved.
//

import Foundation

extension Date {
    
    @nonobjc fileprivate static let fullDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()
    
    func getDateTime() -> String {
        let df = DateFormatter()
        df.timeZone = TimeZone(secondsFromGMT: 0)
        df.dateFormat = "MMM dd, yyyy hh:mm:ss"
        let dateString = df.string(from: self)
        return dateString
    }
    
    func getFullTime() -> String {
        let df = DateFormatter()
        df.timeZone = TimeZone(secondsFromGMT: 0)
        df.dateFormat = "hh:mm a"
        let dateString = df.string(from: self)
        return dateString
    }
    
    // August 31, 2016
    func fullDate(inTimeZone timeZone: TimeZone? = nil) -> String {
        if let timeZone = timeZone {
            Date.fullDateFormatter.timeZone = timeZone
        }
        
        let result = Date.fullDateFormatter.string(from: self)
        
        Date.fullDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        return result
    }
}
