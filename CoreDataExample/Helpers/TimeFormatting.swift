//
//  TimeFormatting.swift
//  CoreDataExample
//
//  Created by 李晨 on 2022/6/28.
//

import Foundation

// calculate the create time or edit time
// since now
func calcTimeSince(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow) / 60
    let hours = minutes / 60
    let days = hours / 24
    
    if minutes < 60 {
        return "\(minutes) minutes ago"
    } else if minutes >= 60 && hours < 24 {
        return "\(hours) hours ago"
    } else {
        return "\(days) days ago"
    }
}
