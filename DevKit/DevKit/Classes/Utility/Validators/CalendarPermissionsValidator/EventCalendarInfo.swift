//
//  EventCalendarInfo.swift
//  TheWing
//
//  Created by Jonathan Samudio on 5/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

/// Contains the event info that is used to add to the calendar.
///
/// **Subspec: Utility/CalendarPermissionsValidator**
///
/// ```
/// EventCalendarInfo(title: title,
///                   notes: description,
///                   startDate: start,
///                   endDate: start.addingTimeInterval(BusinessConstants.defaultEventInterval))
/// ```
///
/// The EventCalendarInfo model is used with the CalendarPermissionsValidator to encapsulate all of the data needed to add a
/// new event.
///
public struct EventCalendarInfo {

    /// Title of the event.
    public let title: String

    /// Optional notes to add to the event.
    public let notes: String?

    /// Start date of the event.
    public let startDate: Date

    /// End date of the event.
    public let endDate: Date

    /// Default initializer of the EventCalendarInfo
    ///
    /// - Parameters:
    ///   - title: Title of the event.
    ///   - notes: Optional notes to add to the event.
    ///   - startDate: Start date of the event.
    ///   - endDate: End date of the event.
    public init(title: String, notes: String?, startDate: Date, endDate: Date) {
        self.title = title
        self.notes = notes
        self.startDate = startDate
        self.endDate = endDate
    }
    
}
