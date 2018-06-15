//
//  TransitioningNavigationView.swift
//  TheWing
//
//  Created by Jonathan Samudio on 4/11/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit
import PureLayout
import Marker

public class TransitioningNavigationView: UIView {

    // MARK: - Private Properties

    private var backButton: UIButton

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.minimumScaleFactor = 0.8
        label.adjustsFontSizeToFitWidth = true
        label.autoSetDimension(.height, toSize: 22)
        return label
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = options.backgroundColor
        view.layer.shadowColor = options.shadowOptions.color
        view.layer.shadowOffset = options.shadowOptions.offset
        view.layer.shadowRadius = options.shadowOptions.radius
        view.layer.shadowOpacity = options.shadowOptions.opacity
        view.clipsToBounds = false
        return view
    }()

    private lazy var labelContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()

    private var titleTopConstraint: NSLayoutConstraint?
    private let options: TransitioningNavigationViewOptions

    // MARK: - Constants

    fileprivate static let bottomOffset: CGFloat = -5
    fileprivate static let labelGutter: CGFloat = 20

    // MARK: - Initialization

    public init(options: TransitioningNavigationViewOptions, backButton: UIButton, barButtons: [UIButton]) {
        self.backButton = backButton
        self.options = options
        super.init(frame: .zero)
        stackView = UIStackView(arrangedSubviews: barButtons)
        setupDesign()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Functions

    /// Transitions the alpha of the background view with the shadow.
    ///
    /// - Parameter percent: Percentage of the view to show.
    func transition(percent: CGFloat) {
        backgroundView.alpha = percent
    }

    /// Transitions the label given an offset.
    ///
    /// - Parameter offset: Offset to move the label view by.
    func transitionLabel(offset: CGFloat) {
        titleTopConstraint?.constant = max(min(-offset, 0), -maxLabelTopOffset())
        layoutIfNeeded()
    }

    /// Sets the title of the label with tail truncation.
    ///
    /// - Parameter title: Title to set the label to.
    func set(title: String) {
        titleLabel.setText(title, using: options.titleTextStyle)
        titleLabel.lineBreakMode = .byTruncatingMiddle
    }

    /// Calculates the transition percentage with the given offset.
    ///
    /// - Parameter offset: Offset to calculate the percentage with.
    /// - Returns: Percentage. (e.g. 0.2)
    func transitionPercentageWith(offset: CGFloat) -> CGFloat {
        return max(min((offset / options.navigationBarThreshold), 1), 0)
    }

}

// MARK: - Private Functions
private extension TransitioningNavigationView {

    func setupDesign() {
        autoSetDimension(.height, toSize: 88)
        backgroundColor = options.backgroundColor

        setupBackgroundView()
        setupLabelView()
        setupBackButton()
        setupStackView()
    }

    func setupBackgroundView() {
        addSubview(backgroundView)
        backgroundView.autoPinEdgesToSuperviewEdges()
    }

    func setupLabelView() {
        insertSubview(labelContainerView, aboveSubview: backgroundView)
        labelContainerView.autoPinEdgesToSuperviewEdges()

        labelContainerView.addSubview(titleLabel)
        titleTopConstraint = titleLabel.autoPinEdge(.top, to: .bottom, of: labelContainerView)
    }

    func setupBackButton() {
        insertSubview(backButton, aboveSubview: labelContainerView)
        backButton.autoPinEdge(.leading, to: .leading, of: self, withOffset: options.backButtonLeadingOffset)
        backButton.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: TransitioningNavigationView.bottomOffset)
        titleLabel.autoPinEdge(.leading, to: .trailing, of: backButton, withOffset: TransitioningNavigationView.labelGutter)
    }

    func setupStackView() {
        insertSubview(stackView, aboveSubview: labelContainerView)
        stackView.autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -options.barButtonTrailingOffset)
        stackView.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: TransitioningNavigationView.bottomOffset)
        titleLabel.autoPinEdge(.trailing, to: .leading, of: stackView, withOffset: -TransitioningNavigationView.labelGutter)
    }

    func maxLabelTopOffset() -> CGFloat {
        return ((labelContainerView.frame.height - titleLabel.frame.height) / 2) - TransitioningNavigationView.bottomOffset
    }

}
