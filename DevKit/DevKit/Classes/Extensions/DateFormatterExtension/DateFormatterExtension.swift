//
//  DateFormatterExtension.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/28/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

/// Collection of all DateFormatter Extensions.
///
/// **Subspec: Extensions/DateFormatterExtension**
///
extension DateFormatter {

    /// Single Instance of DateFormatter for the App.
    private static let sharedInstance = DateFormatter()
    
    /// Uses a static formatter to build you a string from a format, don't use it though,
    /// go to Date Extensions and use that instead.
    ///
    /// - Parameters:
    ///   - date: The date you want the string of
    ///   - dateFormat: The format you want it in.
    /// - Returns: The string.
    static func string(of date: Date, using dateFormat: String) -> String? {
        DateFormatter.sharedInstance.dateFormat = dateFormat
        return DateFormatter.sharedInstance.string(from: date)
    }
    
    /// Converts the given date string to the date in the specific format string and time zone.
    ///
    /// - Parameters:
    ///   - dateString: Date stirng to convert.
    ///   - format: Date String format.
    ///   - timeZone: time zone of the date to be converted.
    /// - Returns: Converted Date.
    static func date(from dateString: String, format: String, timeZone: TimeZone = .current) -> Date? {
        let origTimeZone = sharedInstance.timeZone
        sharedInstance.timeZone = timeZone
        sharedInstance.dateFormat = format

        let result = sharedInstance.date(from: dateString)
        sharedInstance.timeZone = origTimeZone
        return result
    }
    
    /// Converts the given date to the date string in the specific format and time zone.
    ///
    /// - Parameters:
    ///   - date: Date to convert.
    ///   - format: Date String format.
    ///   - timeZone: time zone of the date to be converted.
    /// - Returns: Date string converted from date.
    static func dateString(from date: Date, format: String, timeZone: TimeZone = .current) -> String {
        let origTimeZone = sharedInstance.timeZone
        sharedInstance.timeZone = timeZone
        sharedInstance.setLocalizedDateFormatFromTemplate(format)

        let result = sharedInstance.string(from: date)
        sharedInstance.timeZone = origTimeZone
        return result
    }
    
}
