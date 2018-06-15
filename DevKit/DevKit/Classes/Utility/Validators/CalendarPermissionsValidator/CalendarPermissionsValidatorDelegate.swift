//
//  CalendarPermissionsValidatorDelegate.swift
//  TheWing
//
//  Created by Jonathan Samudio on 5/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

public protocol CalendarPermissionsValidatorDelegate: class {

    /// Called when an event was added.
    ///
    /// - Parameter eventInfo: Event info of the added event.
    func calendarEventAdded(eventInfo: EventCalendarInfo)

    /// Called when the calendar permissions are denied.
    func calendarPermissionsDenied()

}
