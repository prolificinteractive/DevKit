//
//  ReusableView.swift
//  TheWing
//
//  Created by Luna An on 3/31/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation
import UIKit

/// Defines a reusable collection or table view cell.
///
/// **Subspec: Utility/ReusableView**
///
/// ```
/// func registerCell<T: ReusableView>(cellClass: T.Type) {
///     register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
/// }
/// ```
///
/// Used when registering and dequeuing reuseable cells and the identifier is the same as the class name.
///
public protocol ReusableView: class {

    // MARK: - Public Properties

    /// Default reuse identifier is set with the class name.
    static var reuseIdentifier: String { get }

}

extension ReusableView {

    /// Reusable identifier, used to dequeue cells and views.
    public static var reuseIdentifier: String {
        return String(describing: self)
    }

}

// MARK: - ReusableView
extension UICollectionViewCell: ReusableView {

}

// MARK: - ReusableView
extension UITableViewCell: ReusableView {

}

// MARK: - ReusableView
extension UITableViewHeaderFooterView: ReusableView {

}
