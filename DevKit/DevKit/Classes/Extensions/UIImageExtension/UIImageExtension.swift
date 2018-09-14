//
//  UIImageExtension.swift
//  TheWing
//
//  Created by Luna An on 4/5/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

/// Collection of all UIImage Extensions.
///
/// **Subspec: Extensions/UIImageExtension**
///
extension UIImage {
    
    /// Returns an image with a color.
    ///
    /// - Parameter color: The color to use.
    /// - Returns: UIImage.
    public static func imageWithColor(color: UIColor) -> UIImage {
        let size = CGSize(width: 1, height: 1)
        let rect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        
        UIGraphicsEndImageContext()
        return image
    }
    
}
