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
/// override func viewDidLoad() {
///     super.viewDidLoad()
///     addRecognizerForKeyboardDismissal()
/// }
/// ```
public protocol ReusableView: class {

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

/// <Description of the class>
///
/// **Subspec: Folder/Filename**
///
/// ```
/// Code Snippet
/// ```
///
/// <Real world example of how someone would use this class with code snippet>
///
