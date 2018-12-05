//
//  UIViewControllerExtension.swift
//  TheWing
//
//  Created by Luna An on 3/21/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController {
    
    /// Opens url from current view controller.
    ///
    /// - Parameter url: URL.
    public func open(_ url: URL) {
        let webViewController = SFSafariViewController(url: url)
        present(webViewController, animated: true, completion: nil)
    }

}
