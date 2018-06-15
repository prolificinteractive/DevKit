//
//  TransitioningNavigationViewOptions.swift
//  DevKit
//
//  Created by Jonathan Samudio on 5/3/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import UIKit
import Marker

public struct TransitioningNavigationViewOptions {

    /// Background color of the navigation view.
    let backgroundColor: UIColor

    /// Shadow options for the navigation view.
    let shadowOptions: ShadowOptions

    /// Title textstyle.
    let titleTextStyle: TextStyle

    /// Navigation bar threshold.
    let navigationBarThreshold: CGFloat

    /// Leading offset for back button.
    let backButtonLeadingOffset: CGFloat

    /// Trailing offset for the bar button.
    let barButtonTrailingOffset: CGFloat
    
}
