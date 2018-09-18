//
//  InfinityPageControl.swift
//  TheWing
//
//  Created by Prolific Interactive on 8/22/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

/// A infinite page control that shrinks/expands its dots.
///
/// **Subspec: Views/InfinityPageControl**
///
/// ```
/// private lazy var pageControl = InfinityPageControl(activeDotImage: #imageLiteral(resourceName: "active-dot"),
///                                                    inactiveDotImage: #imageLiteral(resourceName: "inactive-dot"))
///
/// pageControl.numberOfPages = dataSources.count
/// pageControl.currentPage = currentPage
/// ```
///
/// The InfinityPageControl allows a infinitely scrollable page control view similar to the instagram style of page control.
/// When initializing the active and inactive images can be set. The number of pages and the current page can be updated post
/// init and will resize upon setting it. When constrainting the page control you can set the height of the view, however
/// please do not set the width of the view since this might cause constraint issues.
///
open class InfinityPageControl: UIControl {

    // MARK: - Public Properties
    
    /// Number of pages.
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
    
    /// Page control's intrinsic content size.
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: 30, height: 7)
    }
    
    // MARK: - Constants
    
    /// Maximium dot limit.
    static let dotLimit: Int = 5

    /// Offset space in between the dots.
    static let dotOffset: Int = 3
    
    // MARK: - Private Properties
    
    /// StackView that contains the dots.
    private var stackView = UIStackView()
    
    /// ScrollView that enables the pagination of the dots.
    private var scrollView = UIScrollView()
    
    /// Array of the paging dots.
    private var dots = [PagingDot]()

    /// Active dot image.
    private let activeDotImage: UIImage

    /// Inactive dot image.
    private let inactiveDotImage: UIImage
    
    // MARK: - Initialization
    
    /// Default initializer of the page control view.
    ///
    /// - Parameters:
    ///   - activeDotImage: Active dot image.
    ///   - inactiveDotImage: Inactive dot image.
    public init(activeDotImage: UIImage, inactiveDotImage: UIImage) {
        self.activeDotImage = activeDotImage
        self.inactiveDotImage = inactiveDotImage

        super.init(frame: CGRect.zero)
        setup()
    }
    
    /// Required initializer for storyboards.
    ///
    /// - Parameter aDecoder: Decoder.
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Interface Builder is not supported.")
    }
    
}

// MARK: - Private Functions
private extension InfinityPageControl {
    
    /// Resets the paging dots to the original state.
    func resetPagingDots() {
        removePagingDots()
        addPagingDots()
        updateDots(direction: .none)
    }
    
    /// Removes all paging dots from the view.
    func removePagingDots() {
        dots.forEach {
            $0.removeFromSuperview()
        }
        dots.removeAll()
    }
    
    /// Adds the paging dots based on the number of pages.
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
    
    /// Updates the dots given a direction.
    ///
    /// - Parameter direction: Direction of the page control.
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
    
    /// Animates the dots when the current page is updated.
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
    
    /// Updates the dots in the stack view with the given parameters.
    ///
    /// - Parameters:
    ///   - oldState: Old state of the paging dot.
    ///   - view: PagingDot to update.
    ///   - direction: Direction of the page control.
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
    
    /// Default state of the paging dot based on the index provided.
    ///
    /// - Parameter index: Index of the desired paging dot.
    /// - Returns: The state of the paging dot.
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
    
    /// Sets up the view to the default state on initialization.
    func setup() {
        clipsToBounds = false
        setupStackView()
        resetPagingDots()
    }
    
    /// Sets up the stack view by adding it to the view and constraining it.
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
    
    /// Configures the stack view properties.
    func configureStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = CGFloat(15)
    }
    
}
