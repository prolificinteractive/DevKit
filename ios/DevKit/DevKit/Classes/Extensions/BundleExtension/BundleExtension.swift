//
//  BundleExtension.swift
//  TheWing
//
//  Created by Luna An on 8/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

/// Collection of all Bundle Extensions.
///
/// **Subspec: Extensions/BundleExtension**
///
extension Bundle {
    
    /// Release version number - this is the version number that will likely to be be seen by the public.
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// Build version number - this is the version number that is often internally referred.
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    /// Formatted release version number.
    var formattedReleaseVersionNumber: String {
        return "VERSION \(releaseVersionNumber ?? "1.0.0")"
    }
    
}

