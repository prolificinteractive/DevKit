//
//  CalendarPermissionsValidator.swift
//  TheWing
//
//  Created by Jonathan Samudio on 5/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation
import EventKit

/// Validates the permissions for the app to access the calendar.
///
/// **Subspec: Utility/CalendarPermissionsValidator**
///
/// ```
/// private lazy var calendarPermissionsValidator: CalendarPermissionsValidator = {
///     let validator = CalendarPermissionsValidator()
///     validator.delegate = self
///     return validator
/// }()
///
/// calendarPermissionsValidator.addEventToCalendar(eventInfo: eventCalendarInfo)
/// ```
///
/// The CalendarPermissionsValidator uses the default EKEventStore to add an event to a user's calendar if the necessary
/// permissions are given.
///
open class CalendarPermissionsValidator {

    // MARK: - Public Properties

    /// Permissions delegate.
    public weak var delegate: CalendarPermissionsValidatorDelegate?

    // MARK: - Private Properties

    /// Default event store from the EventKit.
    private static var eventStore = EKEventStore()

    // MARK: - Public Functions

    /// Attempts to add a event to the calendar.
    ///
    /// - Parameter eventInfo: Event info to add.
    public func addEventToCalendar(eventInfo: EventCalendarInfo) {
        let authorizationStatus = EKEventStore.authorizationStatus(for: EKEntityType.event)
        checkCalendarPermissions(status: authorizationStatus, eventInfo: eventInfo)
    }

    // MARK: - Initialization

    /// Default initializer
    public init() { }
    
}

// MARK: - Private Functions
private extension CalendarPermissionsValidator {

    /// Checks the current calendar's permissions.
    ///
    /// - Parameters:
    ///   - status: Status of the calendar permissions.
    ///   - eventInfo: User's event info to add to calendar.
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

    /// Requests the current user's permissions with the given parameter.
    ///
    /// - Parameter eventInfo: Event info to add to the calendar.
    func requestCalendarPemissions(eventInfo: EventCalendarInfo) {
        CalendarPermissionsValidator.eventStore.requestAccess(to: .event) { (granted, error) in
            if granted, error == nil {
                self.addToCalendar(eventInfo: eventInfo)
            }
        }
    }

    /// Adds the event infor to the calendar if it is not already found.
    ///
    /// - Parameter eventInfo: Event info to add to the calendar.
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

    /// Determines if the event info provided is already found in the calendar.
    ///
    /// - Parameter eventInfo: Event info to add to the calendar.
    /// - Returns: Flag that determines if the event was found.
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

    /// Generates an EKEvent from the EventCalendarInfo.
    ///
    /// - Parameter eventInfo: Event info used to convert to an EKEvent.
    /// - Returns: EKEvent from the EventCalendarInfo.
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
