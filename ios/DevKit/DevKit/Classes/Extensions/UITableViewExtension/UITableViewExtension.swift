//
//  UITableViewExtension.swift
//  TheWing
//
//  Created by Luna An on 4/5/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

/// Collection of all UITableView Extensions.
///
/// **Subspec: Extensions/UITableViewExtension**
///
extension UITableView {
    
    /// Get an index set with all the sections in this table view.
    public var allSectionsIndexSet: IndexSet {
        return IndexSet(integersIn: 0..<numberOfSections)
    }

    /// Reload the table view with an animation
    ///
    /// - Warning: Do not call this if the number of sections has changed since you last
    /// called `reloadData`.
    ///
    /// - Parameter animation: the animation you want.
    public func reloadAllSections(with animation: UITableViewRowAnimation = .automatic) {
        reloadSections(allSectionsIndexSet, with: animation)
    }

    /// Dequeues a reusable table view cell.
    ///
    /// - Parameter indexPath: The index path.
    /// - Returns: The collection view cell.
    public func dequeueReusableCell<T: ReusableView>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Can't dequeue a collection view cell with identifier \(T.reuseIdentifier)")
        }

        return cell
    }

    /// Dequeues a reusable header footer view.
    public func dequeueReusableHeaderFooterView<T: ReusableView>() -> T {
        guard let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Can't dequeue a header footer view with identifier \(T.reuseIdentifier)")
        }

        return headerFooter
    }

    /// Registers the table view cell with its reuseidentifier.
    ///
    /// - Parameters cellClass: The cell class to use.
    public func registerCell<T: ReusableView>(cellClass: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    /// Registers the table view cell nib with its reuseidentifier.
    ///
    /// - Parameter cellClass: Class of the cell to register.
    public func registerCellNib<T: ReusableView>(cellClass: T.Type) {
        register(UINib(nibName: cellClass.reuseIdentifier, bundle: Bundle.main),
                 forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    /// Registers the header footer view its reuseidentifier.
    ///
    /// - Parameters aClass: The view class to use.
    public func registerHeaderFooterView<T: ReusableView>(_ aClass: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
}
