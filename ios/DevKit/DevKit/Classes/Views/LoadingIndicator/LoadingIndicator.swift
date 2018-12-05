//
//  LoadingIndicator.swift
//  TheWing
//
//  Created by Jonathan Samudio on 4/9/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

/// Displays and hides a loading indicator in the center of the view.
///
/// **Subspec: View/LoadingIndicator**
///
/// ```
/// private lazy var loadingIndicator = LoadingIndicator(activityIndicatorViewStyle: .gray,
///                                                      indicatorColor: theme.colorTheme.emphasisPrimary)
///
/// loadingIndicator.isLoading(loading: loading)
/// ```
///
/// Simply adds a UIActivityIndicatorView to the center of LoadingIndicator view and allows to change the loading status.
///
open class LoadingIndicator: UIView {

    // MARK: - Private Properties

    /// Indicatior view.
    private var loadingIndicator: UIActivityIndicatorView?

    /// Style of the indicator.
    private let activityIndicatorViewStyle: UIActivityIndicatorViewStyle

    /// Custom color of the indicator.
    private let indicatorColor: UIColor?

    // MARK: - Initialization

    /// Default initializer of the view.
    ///
    /// - Parameters:
    ///   - activityIndicatorViewStyle: Indicator style. Defaults to white.
    ///   - indicatorColor: Custom color of the indicator.
    public init(activityIndicatorViewStyle: UIActivityIndicatorViewStyle = .white, indicatorColor: UIColor? = nil) {
        self.activityIndicatorViewStyle = activityIndicatorViewStyle
        self.indicatorColor = indicatorColor
        super.init(frame: .zero)
        backgroundColor = .clear
        isUserInteractionEnabled = false
    }
    
    /// Required initializer of the view.
    ///
    /// - Parameter aDecoder: Decoder.
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Functions

    /// Shows the loading indicator with the parameter provided.
    ///
    /// - Parameter loading: Determines if there is a network request occuring.
    public func isLoading(loading: Bool) {
        if loading {
            addLoadingIndicatorIfNeeded()
            showLoadingIndicator(show: true)
        } else {
            showLoadingIndicator(show: false, completion: { (_) in
                self.hideLoadingIndicator()
            })
        }
    }
    
}

// MARK: - Private Functions
private extension LoadingIndicator {

    /// Will add the loading indicator if its not already added.
    func addLoadingIndicatorIfNeeded() {
        if let indicator = loadingIndicator {
            addLoadingIndicator(indicator: indicator)
        } else {
            let indicator = UIActivityIndicatorView(activityIndicatorStyle: activityIndicatorViewStyle)
            indicator.color = indicatorColor
            loadingIndicator = indicator
            addLoadingIndicator(indicator: indicator)
        }
    }

    /// Shows the loading indicator with the given parameters.
    ///
    /// - Parameters:
    ///   - show: Flag to show if the loading indicator is visible.
    ///   - completion: Completion block of the display animation.
    func showLoadingIndicator(show: Bool, completion: ((Bool) -> Void)? = nil) {
        self.loadingIndicator?.alpha = show ? 0 : 1
        UIView.animate(withDuration: 0.2, animations: {
            self.loadingIndicator?.alpha = show ? 1 : 0
        }, completion: completion)
    }

    /// Hides the loading indicator by stopping the animation and removing it from the superview.
    func hideLoadingIndicator() {
        loadingIndicator?.stopAnimating()
        loadingIndicator?.removeFromSuperview()
    }
    
    /// Adds the loading indicator and starts animating it.
    ///
    /// - Parameter indicator: Indicator to add.
    private func addLoadingIndicator(indicator: UIActivityIndicatorView) {
        addSubview(indicator)
        indicator.autoCenterInSuperview()
        indicator.startAnimating()
    }

}
