//
//  UIViewExtension.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/21/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

extension UIView {

    /// Returns height of view if given fixed width.
    ///
    /// - Parameter width: Width.
    /// - Returns: Height.
    func heightForWidth(_ width: CGFloat) -> CGFloat {
        return sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)).height
    }
    
    /// Adds a divider view with the given parameters.
    ///
    /// - Parameters:
    ///   - height: Height of the divder view.
    ///   - leadingOffset: Leading offset of the divider view.
    ///   - color: Color of the divider view.
    func addDividerView(height: CGFloat = 1, leadingOffset: CGFloat = 0, color: UIColor) {
        let dividerView = UIView()
        dividerView.backgroundColor = color
        addSubview(dividerView)
        dividerView.autoSetDimension(.height, toSize: height)
        dividerView.autoPinEdge(.bottom, to: .bottom, of: self)
        dividerView.autoPinEdge(.leading, to: .leading, of: self, withOffset: leadingOffset)
        dividerView.autoPinEdge(.trailing, to: .trailing, of: self)
    }
    
    /// Returns a blank view to be used as a divider in stack views.
    ///
    /// - Parameters:
    ///   - width: Width.
    ///   - height: Height.
    ///   - color: Background color.
    /// - Returns: UIView.
    static func dividerView(width: CGFloat? = nil,
                            height: CGFloat? = nil,
                            color: UIColor = UIColor.clear) -> UIView {
        let divider = UIView()
        divider.backgroundColor = color

        if let height = height {
            divider.autoSetDimension(.height, toSize: height)
        }

        if let width = width {
            divider.autoSetDimension(.width, toSize: width)
        }
        return divider
    }
    
}
