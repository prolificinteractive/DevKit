//
//  HapticGenerator.swift
//  SoulCycle
//
//  Created by Michael Campbell on 3/23/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

/// The haptic generator.
@objcMembers public class HapticGenerator: NSObject {

    // MARK: - UIImpactFeedbackGenerator

    @available(iOS 10.0, *)
    /// Generates impact feedback haptics.
    ///
    /// - Parameter style: The impact feedback style.
    static func generateImpactFeedback(style: UIImpactFeedbackStyle) {
        impactFeedbackGenerator(style: style).impactOccurred()
    }

    @available(iOS 10.0, *)
    /// Generates impact feedback haptics with random strength.
    public static func generateRandomImpactFeedback() {
        switch arc4random_uniform(3) {
        case 0:
            HapticGenerator.generateImpactFeedback(style: .light)
        case 1:
            HapticGenerator.generateImpactFeedback(style: .medium)
        case 2:
            HapticGenerator.generateImpactFeedback(style: .heavy)
        default:
            HapticGenerator.generateImpactFeedback(style: .medium)
        }
    }

    @available(iOS 10.0, *)
    private static func impactFeedbackGenerator(style: UIImpactFeedbackStyle) -> UIImpactFeedbackGenerator {
        let impactFeedbackGenerator = UIImpactFeedbackGenerator(style: style)
        impactFeedbackGenerator.prepare()

        return impactFeedbackGenerator
    }

    // MARK: - UINotificationFeedbackGenerator

    @available(iOS 10.0, *)
    /// Generates notification feedback haptics.
    ///
    /// - Parameter type: The notification feedback type.
    public static func generateNotificationFeedback(type: UINotificationFeedbackType) {
        notificationFeedbackGenerator().notificationOccurred(type)
    }

    @available(iOS 10.0, *)
    private static func notificationFeedbackGenerator() -> UINotificationFeedbackGenerator {
        let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
        notificationFeedbackGenerator.prepare()

        return notificationFeedbackGenerator
    }

    // MARK: - UISelectionFeedbackGenerator

    @available(iOS 10.0, *)
    /// Generates selection feedback haptics.
    public static func generateSelectionFeedback() {
        selectionFeedbackGenerator().selectionChanged()
    }

    @available(iOS 10.0, *)
    private static func selectionFeedbackGenerator() -> UISelectionFeedbackGenerator {
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
        selectionFeedbackGenerator.prepare()
        
        return selectionFeedbackGenerator
    }
    
}
