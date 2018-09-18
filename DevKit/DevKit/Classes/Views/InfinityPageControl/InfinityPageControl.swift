//
//  InfinityPageControl.swift
//  TheWing
//
//  Created by Prolific Interactive on 8/22/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

/// A page control that shrinks/expands its dots
///
/// **Subspec: Views/InfinityPageControl**
///
/// ```
/// private lazy var pageControl = InfinityPageControl(activeDotImage: #imageLiteral(resourceName: "active-dot"),
///                                                    inactiveDotImage: #imageLiteral(resourceName: "inactive-dot"))
/// ```
///
/// <Real world example of how someone would use this class with code snippet>
///
open class InfinityPageControl: UIControl {

    // MARK: - Public Properties
    
    /// Number of pages
    public var numberOfPages: Int = 0 {
        didSet {
            resetPagingDots()
        }
    }
    
    /// Current page of the page control.
    public var currentPage: Int = 0 {
        didSet {
            let direction = PageControlDirection.direction(previousPage: oldValue, currentPage: currentPage)
            currentPage = min(max(currentPage, 0), numberOfPages)
            updateDots(direction: direction)
            animateDots()
        }
    }
    
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 30, height: 7)
    }
    
    // MARK: - Constants
    
    static let dotLimit: Int = 5
    
    static let dotOffset: Int = 3
    
    // MARK: - Private Properties
    
    private var stackView = UIStackView()
    
    private var scrollView = UIScrollView()
    
    private var dots = [PagingDot]()

    private let activeDotImage: UIImage

    private let inactiveDotImage: UIImage
    
    // MARK: - Initialization
    
    public init(activeDotImage: UIImage, inactiveDotImage: UIImage) {
        self.activeDotImage = activeDotImage
        self.inactiveDotImage = inactiveDotImage

        super.init(frame: CGRect.zero)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Interface Builder is not supported.")
    }
    
}

// MARK: - Private Functions
private extension InfinityPageControl {
    
    func resetPagingDots() {
        removePagingDots()
        addPagingDots()
        updateDots(direction: .none)
    }
    
    func removePagingDots() {
        dots.forEach {
            $0.removeFromSuperview()
        }
        dots.removeAll()
    }
    
    func addPagingDots() {
        for index in 0..<numberOfPages {
            let dot = PagingDot(state: defaultState(for: index),
                                activeDotImage: activeDotImage,
                                inactiveDotImage: inactiveDotImage)

            dot.update(stateMove: .noChange)
            stackView.insertArrangedSubview(dot, at: index)
            dots.append(dot)
        }
    }
    
    func updateDots(direction: PageControlDirection) {
        for (index, dot) in dots.enumerated() {
            let oldState = dot.state
            dot.update(stateMove: PagingDotStateMachine.state(for: index,
                                                              selectedIndex: currentPage,
                                                              direction: direction,
                                                              numberOfPages: numberOfPages))
            dot.active = currentPage == index
            
            updateStackView(with: oldState, view: dot, direction: direction)
        }
    }
    
    func animateDots() {
        guard currentPage > 0 else {
            return
        }
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: ({
                        self.stackView.layoutIfNeeded()
                       }), completion: nil)
    }
    
    func updateStackView(with oldState: PagingDotState,
                         view: PagingDot,
                         direction: PageControlDirection) {
        if oldState == .hidden && oldState != view.state {
            if direction == .left {
                stackView.insertArrangedSubview(view, at: 0)
            } else if direction == .right {
                stackView.addArrangedSubview(view)
            }
        }
        
        if view.state == .hidden {
            stackView.removeArrangedSubview(view)
        }
    }
    
    private func defaultState(for index: Int) -> PagingDotState {
        guard numberOfPages >= InfinityPageControl.dotLimit else {
            return .large
        }
        
        if index < InfinityPageControl.dotLimit - 1 {
            return .large
        } else if index == InfinityPageControl.dotLimit - 1 {
            return .medium
        } else if index == InfinityPageControl.dotLimit {
            return .small
        }
        
        return .hidden
    }
    
    func setup() {
        clipsToBounds = false
        setupStackView()
        resetPagingDots()
    }
    
    func setupStackView() {
        configureStackView()
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = CGFloat(15)
    }
    
}
