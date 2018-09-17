//
//  CALayerExtensions.swift
//  TheWing
//
//  Created by Paul Jones on 7/11/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

/// Collection of all CALayer Extensions.
///
/// **Subspec: Extensions/CALayerExtension**
///
extension CALayer {
    
    /// This accepts paramters that Sketch has, and turns them into the identical shadow on this layer.
    ///
    /// - Parameters:
    ///   - color: the color of the shadow
    ///   - alpha: the alpha of the shadow
    ///   - shadowX: the X-axis offset
    ///   - shawdowY: the Y-axis offset
    ///   - blur: what Sketch calls "blur"
    ///   - spread: what Sketch calls "spread"
    func applySketchShadow(color: UIColor,
                           alpha: Float = 1,
                           shadowX: CGFloat = 0,
                           shawdowY: CGFloat = 0,
                           blur: CGFloat,
                           spread: CGFloat = 0) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: shadowX, height: shawdowY)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let differenceInX = -spread
            let rect = bounds.insetBy(dx: differenceInX, dy: differenceInX)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }

}
