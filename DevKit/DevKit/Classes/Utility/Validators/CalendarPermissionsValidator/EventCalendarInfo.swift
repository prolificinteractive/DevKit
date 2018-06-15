//
//  EventCalendarInfo.swift
//  TheWing
//
//  Created by Jonathan Samudio on 5/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

public struct EventCalendarInfo {

    /// Title of the event.
    public let title: String

    /// Optional notes to add to the event.
    public let notes: String?

    /// Start date of the event.
    public let startDate: Date

    /// End date of the event.
    public let endDate: Date

    public init(title: String, notes: String?, startDate: Date, endDate: Date) {
        self.title = title
        self.notes = notes
        self.startDate = startDate
        self.endDate = endDate
    }
    
}
