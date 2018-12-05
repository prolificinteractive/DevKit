//
//  UICollectionViewExtension.swift
//  TheWing
//
//  Created by Luna An on 3/31/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    /// Dequeues a reusable collection view cell.
    ///
    /// - Parameter indexPath: The index path.
    /// - Returns: The collection view cell.
    public func dequeueReusableCell<T: ReusableView>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Can't dequeue a collection view cell with identifier \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    /// Registers the collection view cell with its reuseidentifier.
    ///
    /// - Parameters cellClass: The cell class to use.
    public func registerCell<T: ReusableView>(cellClass: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
}
