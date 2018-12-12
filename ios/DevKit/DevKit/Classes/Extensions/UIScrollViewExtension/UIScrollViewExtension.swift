//
//  UIScrollViewExtension.swift
//  TheWing
//
//  Created by Jonathan Samudio on 4/18/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

extension UIScrollView {

    /// Scrolls the rect to the center of the scrollview.
    ///
    /// - Parameters:
    ///   - rect: Rect or frame to scroll to.
    ///   - animated: Flag to animate the scroll.
    public func scrollToCentered(_ rect: CGRect, animated: Bool) {
        let centeredX = rect.origin.x + (rect.width / 2) - (frame.width / 2)
        let centeredY = rect.origin.y + (rect.height / 2) - (frame.height / 2)
        let centeredRect = CGRect(x: centeredX, y: centeredY, width: frame.width, height: frame.height)
        scrollRectToVisible(centeredRect, animated: animated)
    }

    /// Boolean function determining if scrollview has scrolled past a given threshold.
    ///
    /// - Parameter percentageThreshold: Threshold percentage.
    /// - Returns: True, if scrolled past, false otherwise.
    public func scrolledPastThreshold(_ percentageThreshold: CGFloat) -> Bool {
        let offset = contentOffset.y + bounds.height
        let height = contentSize.height
        let percentage = offset / height
        return percentage > percentageThreshold
    }

}
