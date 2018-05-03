//
//  CalendarPermissionsValidatorDelegate.swift
//  TheWing
//
//  Created by Jonathan Samudio on 5/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

protocol CalendarPermissionsValidatorDelegate: class {

    /// Called when an event was added.
    ///
    /// - Parameter eventInfo: Event info of the added event.
    func calendarEventAdded(eventInfo: EventCalendarInfo)

    /// Called when the calendar permissions are denied.
    func calendarPermissionsDenied()

}

// MARK: - CalendarPermissionsValidatorDelegate
extension UIViewController: CalendarPermissionsValidatorDelegate {

    func calendarEventAdded(eventInfo: EventCalendarInfo) {
        let message = "\(eventInfo.title)\("HAPPENING_ADDED_MESSAGE".localized(comment: "Happening added message"))"
        let title = "HAPPENING_ADDED_TITLE".localized(comment: "Happening Added")
        let alert = UIAlertController.singleActionAlertController(title: title, message: message)
        present(alert, animated: true, completion: nil)
    }

    func calendarPermissionsDenied() {
        let title = "CALENDAR_ACCESS_TITLE".localized(comment: "Calendar Access Title")
        let message = "CALENDAR_ACCESS_MESSAGE".localized(comment: "Calendar Access Message")
        let cancel = "CANCEL_TITLE".localized(comment: "Cancel")
        let settings = "SETTINGS".localized(comment: "Settings")
        let alert = UIAlertController.doubleActionAlertController(title: title,
                                                                  message: message,
                                                                  actionOneTitle: cancel,
                                                                  actionTwoTitle: settings,
                                                                  actionOne: nil) {
                                                                    UIApplication.shared.openSettings()
        }
        present(alert, animated: true, completion: nil)
    }

}
