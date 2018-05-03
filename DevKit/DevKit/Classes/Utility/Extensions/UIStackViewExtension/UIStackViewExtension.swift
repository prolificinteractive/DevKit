//
//  UIStackViewExtension.swift
//  TheWing
//
//  Created by Ruchi Jain on 3/26/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

extension UIStackView {
    
    /// Removes all arranged subviews.
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
}
