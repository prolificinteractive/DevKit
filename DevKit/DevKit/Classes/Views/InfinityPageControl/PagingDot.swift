//
//  PagingDot.swift
//  TheWing
//
//  Created by Prolific Interactive on 8/22/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

/// A dot in the page control
final class PagingDot: UIView {
    
    // MARK: - Public Properties
    
    /// The active state.
    var active: Bool = false {
        didSet {
            configure(for: active)
        }
    }
    
    /// Dot size state.
    var state: PagingDotState = .large
    
    // MARK: - Private Properties
    
    private let imageView = UIImageView(image: #imageLiteral(resourceName: "active-dot"))
    
    private weak var sizeConstraint: NSLayoutConstraint!
    
    private let largeSize: CGFloat = 5.5
    
    private let mediumSize: CGFloat = 4
    
    private let smallSize: CGFloat = 2.5
    
    private let hiddenSize: CGFloat = 0
    
    // MARK: - Initialization
    
    required init(state: PagingDotState) {
        super.init(frame: CGRect.zero)
        setup()
        self.state = state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Interface Builder is not supported.")
    }
    
    // MARK: - Public Functions
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    /// Update the paging dot state.
    ///
    /// - Parameter stateMove: A PagingDotStateMachine enum case.
    func update(stateMove: PagingDotStateMachine) {
        configure(for: active)
        updateState(with: stateMove)
        sizeConstraint.constant = size(for: state)
    }
    
}

// MARK: - Private Functions
private extension PagingDot {
    
    func configure(for activeState: Bool) {
        imageView.image = activeState ? #imageLiteral(resourceName: "active-dot") : #imageLiteral(resourceName: "inactive-dot")
        alpha = state == .hidden ? 0 : 1
    }
    
    func updateState(with stateMove: PagingDotStateMachine) {
        switch stateMove {
        case .noChange:
            return
        case .expand:
            state = state.previousState()
        case .shrink:
            state = state.nextState()
        }
    }
    
    func size(for state: PagingDotState) -> CGFloat {
        switch state {
        case .large:
            return largeSize
        case .medium:
            return mediumSize
        case .small:
            return smallSize
        default:
            return hiddenSize
        }
    }
    
    func setup() {
        setupImageView()
        sizeConstraint = widthAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalTo: self.widthAnchor),
            sizeConstraint
            ])
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
}
