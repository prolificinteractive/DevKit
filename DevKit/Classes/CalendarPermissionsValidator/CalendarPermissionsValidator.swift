//
//  CalendarPermissionsValidator.swift
//  TheWing
//
//  Created by Jonathan Samudio on 5/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation
import EventKit

final class CalendarPermissionsValidator {

    // MARK: - Public Properties

    weak var delegate: CalendarPermissionsValidatorDelegate?

    // MARK: - Private Properties

    private static var eventStore = EKEventStore()

    // MARK: - Public Functions

    /// Attempts to add a event to the calendar.
    ///
    /// - Parameter eventInfo: Event info to add.
    func addEventToCalendar(eventInfo: EventCalendarInfo) {
        let authorizationStatus = EKEventStore.authorizationStatus(for: EKEntityType.event)
        checkCalendarPermissions(status: authorizationStatus, eventInfo: eventInfo)
    }

}

// MARK: - Private Functions
private extension CalendarPermissionsValidator {

    func checkCalendarPermissions(status: EKAuthorizationStatus, eventInfo: EventCalendarInfo) {
        switch status {
        case EKAuthorizationStatus.notDetermined:
            requestCalendarPemissions(eventInfo: eventInfo)
        case EKAuthorizationStatus.authorized:
            addToCalendar(eventInfo: eventInfo)
        case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
            delegate?.calendarPermissionsDenied()
        }
    }

    func requestCalendarPemissions(eventInfo: EventCalendarInfo) {
        CalendarPermissionsValidator.eventStore.requestAccess(to: .event) { (granted, error) in
            if granted, error == nil {
                self.addToCalendar(eventInfo: eventInfo)
            }
        }
    }

    func addToCalendar(eventInfo: EventCalendarInfo) {
        guard !eventFoundInCalendar(eventInfo: eventInfo) else {
            delegate?.calendarEventAdded(eventInfo: eventInfo)
            return
        }

        do {
            let event = newEvent(eventInfo: eventInfo)
            try CalendarPermissionsValidator.eventStore.save(event, span: .thisEvent)
            delegate?.calendarEventAdded(eventInfo: eventInfo)
        } catch let error {
            print("failed to save event with error : \(error)")
        }
    }

    func eventFoundInCalendar(eventInfo: EventCalendarInfo) -> Bool {
        let eventStore = CalendarPermissionsValidator.eventStore
        let predicate = eventStore.predicateForEvents(withStart: eventInfo.startDate, end: eventInfo.endDate, calendars: nil)
        var eventFound = false
        eventStore.enumerateEvents(matching: predicate) { (event, _) in
            if event.title == eventInfo.title {
                eventFound = true
            }
        }
        return eventFound
    }

    func newEvent(eventInfo: EventCalendarInfo) -> EKEvent {
        let event = EKEvent(eventStore: CalendarPermissionsValidator.eventStore)
        event.title = eventInfo.title
        event.startDate = eventInfo.startDate
        event.endDate = eventInfo.endDate
        event.notes = eventInfo.notes ?? ""
        event.calendar = CalendarPermissionsValidator.eventStore.defaultCalendarForNewEvents
        return event
    }
    
}
