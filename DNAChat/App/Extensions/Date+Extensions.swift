//
//  Date+Extensions.swift
//  DNAChat
//
//  Created by Aleksander Popek on 11/05/2021.
//

import Foundation

extension Date {
    var timeAgo: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(
            for: self,
            relativeTo: Date()
        )
    }
}
