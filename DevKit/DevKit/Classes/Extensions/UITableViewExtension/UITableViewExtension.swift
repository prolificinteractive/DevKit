//
//  UITableViewExtension.swift
//  TheWing
//
//  Created by Luna An on 4/5/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Dequeues a reusable table view cell.
    ///
    /// - Parameter indexPath: The index path.
    /// - Returns: The collection view cell.
    public func dequeueReusableCell<T: ReusableCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Can't dequeue a collection view cell with identifier \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    /// Dequeues a reusable header footer view.
    public func dequeueReusableHeaderFooterView<T: ReusableCell>() -> T {
        guard let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Can't dequeue a header footer view with identifier \(T.reuseIdentifier)")
        }
        
        return headerFooter
    }
    
    /// Registers the table view cell with its reuseidentifier.
    ///
    /// - Parameters cellClass: The cell class to use.
    public func registerCell<T: ReusableCell>(cellClass: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Registers the header footer view its reuseidentifier.
    ///
    /// - Parameters aClass: The view class to use.
    public func registerHeaderFooterView<T: ReusableCell>(_ aClass: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
}
