//
//  TapGestureGenerater.swift
//  TapGestureGenerater
//
//  Created by Mai Ikeda on 2015/08/21.
//  Copyright (c) 2015年 mai_ikeda. All rights reserved.
//

import UIKit

public class TapGestureGenerater: UIView {
    
    // tap
    private var didTapGesture: ((TapGestureGenerater) -> Void)?
    private var didDoubleTapGesture: ((TapGestureGenerater) -> Void)?
    private var didTripleTapGesture: ((TapGestureGenerater) -> Void)?
    
    // touches
    private var didTouchesBegan: ((TapGestureGenerater, CGPoint) -> Void)?
    private var didTouchesCancelled: ((TapGestureGenerater, CGPoint) -> Void)?
    private var didTouchesEnded: ((TapGestureGenerater, CGPoint) -> Void)?
    
    // dragging
    private var draggingGesture: ((TapGestureGenerater, CGPoint) -> Void)?
    
    // pinch
    private var pinchGesture: UIPinchGestureRecognizer?
    private var pinchingGesture: ((TapGestureGenerater, UIPinchGestureRecognizer) -> Void)?
    private var didPinchInGesture: ((TapGestureGenerater, UIPinchGestureRecognizer) -> Void)?
    private var didPinchOutGesture: ((TapGestureGenerater, UIPinchGestureRecognizer) -> Void)?
    
    // swip
    private var didSwipToLeftGesture: ((TapGestureGenerater, UIGestureRecognizer) -> Void)?
    private var didSwipToRightGesture: ((TapGestureGenerater, UIGestureRecognizer) -> Void)?
    private var didSwipToUpGesture: ((TapGestureGenerater, UIGestureRecognizer) -> Void)?
    private var didSwipToDownGesture: ((TapGestureGenerater, UIGestureRecognizer) -> Void)?
}

//
// MARK:- override method
//
extension TapGestureGenerater {
    
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.locationInView(self)
            didTouchesBegan?(self, point)
        }
    }
    
    override public func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if let touch = touches?.first {
            let point = touch.locationInView(self)
            didTouchesCancelled?(self, point)
        }
    }
    
    override public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let draggingGesture = draggingGesture, let firstTouch = touches.first {
            let location = firstTouch.locationInView(self)
            let prevLocation = firstTouch.previousLocationInView(self)
            let deltaX = location.x - prevLocation.x
            let deltaY = location.y - prevLocation.y
            let deltaPoint = CGPoint(x: deltaX, y: deltaY)
            draggingGesture(self, deltaPoint)
        }
    }
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.locationInView(self)
            didTouchesEnded?(self, point)
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        userInteractionEnabled = true
    }
    
    override public func removeFromSuperview() {
        super.removeFromSuperview()
        reset()
    }
}

//
// MARK:- All gestures is reset
//
extension TapGestureGenerater {
    
    public func reset() {
        if let gestureRecognizers = gestureRecognizers {
            for gestureRecognizer in gestureRecognizers {
                removeGestureRecognizer(gestureRecognizer)
            }
        }
        didTouchesBegan = nil
        didTouchesCancelled = nil
        draggingGesture = nil
        didTouchesEnded = nil
        pinchGesture = nil
        pinchingGesture = nil
        didPinchInGesture = nil
        didPinchOutGesture = nil
    }
}

//
// MARK:- Set tap gestures
//
extension TapGestureGenerater {
    
    public func setTapGesture(event: (TapGestureGenerater) -> Void) {
        didTapGesture = event
        let gesture = UITapGestureRecognizer(target: self, action: "tapGestureRecognizerEvent:")
        addGestureRecognizer(gesture)
    }
    
    public func setDoubleTapGesture(event: (TapGestureGenerater) -> Void) {
        didDoubleTapGesture = event
        let gesture = UITapGestureRecognizer(target: self, action: "doubleTapGestureRecognizerEvent:")
        gesture.numberOfTapsRequired = 2
        addGestureRecognizer(gesture)
    }
    
    public func setTripleTapGesture(event: (TapGestureGenerater) -> Void) {
        didTripleTapGesture = event
        let gesture = UITapGestureRecognizer(target: self, action: "tripleTapGestureRecognizerEvent:")
        gesture.numberOfTapsRequired = 3
        addGestureRecognizer(gesture)
    }
}

//
// MARK:- Set touches and dragging
//
extension TapGestureGenerater {
    
    public func setTouchesBegan(event: (TapGestureGenerater, CGPoint) -> Void) {
        didTouchesBegan = event
    }
    
    public func setTouchesCancelled(event: (TapGestureGenerater, CGPoint) -> Void) {
        didTouchesCancelled = event
    }
    
    public func setTouchesEnded(event: (TapGestureGenerater, CGPoint) -> Void) {
        didTouchesEnded = event
    }
    
    public func setDraggingGesture(event: (TapGestureGenerater, CGPoint) -> Void) {
        draggingGesture = event
    }
}

//
// MARK:- Set pinch gestures
//
extension TapGestureGenerater {
    
    public func setPinchingGesture(event: (TapGestureGenerater, UIPinchGestureRecognizer) -> Void) {
        if pinchGesture == nil {
            setPinchGesture()
        }
        pinchingGesture = event
    }
    
    public func setPinchInGesture(event: (TapGestureGenerater, UIPinchGestureRecognizer) -> Void) {
        if pinchGesture == nil {
            setPinchGesture()
        }
        didPinchInGesture = event
    }
    
    public func setPinchOutGesture(event: (TapGestureGenerater, UIPinchGestureRecognizer) -> Void) {
        if pinchGesture == nil {
            setPinchGesture()
        }
        didPinchOutGesture = event
    }
    
    private func setPinchGesture() {
        pinchGesture = UIPinchGestureRecognizer(target: self, action: "pinchGestureRecognizerEvent:")
        if let pinchGesture = pinchGesture {
            addGestureRecognizer(pinchGesture)
        }
    }

}

//
// MARK:- Set swip gestures
//
extension TapGestureGenerater {
    
    public func setSwipToLeftGesture(event: (TapGestureGenerater, UIGestureRecognizer) -> Void) {
        didSwipToLeftGesture = event
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToLeftGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Left
        addGestureRecognizer(gesture)
    }
    
    public func setSwipToRightGesture(event: (TapGestureGenerater, UIGestureRecognizer) -> Void) {
        didSwipToRightGesture = event
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToRightGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Right
        addGestureRecognizer(gesture)
    }
    
    public func setSwipToUpGesture(event: (TapGestureGenerater, UIGestureRecognizer) -> Void) {
        didSwipToUpGesture = event
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToUpGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Up
        addGestureRecognizer(gesture)
    }
    
    public func setSwipToDownGesture(event: (TapGestureGenerater, UIGestureRecognizer) -> Void) {
        didSwipToDownGesture = event
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToDownGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Down
        addGestureRecognizer(gesture)
    }
}

//
// MARK:- Protocol
//
extension TapGestureGenerater {
    
    func tapGestureRecognizerEvent(sender: UITapGestureRecognizer) {
        didTapGesture?(self)
    }
    
    func doubleTapGestureRecognizerEvent(sender: UITapGestureRecognizer) {
        didDoubleTapGesture?(self)
    }
    
    func tripleTapGestureRecognizerEvent(sender: UITapGestureRecognizer) {
        didTripleTapGesture?(self)
    }
    
    func pinchGestureRecognizerEvent(sender: UIPinchGestureRecognizer) {
        pinchingGesture?(self, sender)
        
        let firstPoint = sender.scale
        let secondPoint = sender.velocity
        
        if firstPoint < secondPoint {
            didPinchOutGesture?(self, sender)
        } else {
            didPinchInGesture?(self, sender)
        }
    }
    
    func swipToLeftGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        didSwipToLeftGesture?(self, gesture)
    }
    
    func swipToRightGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        didSwipToRightGesture?(self, gesture)
    }
    
    func swipToUpGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        didSwipToUpGesture?(self, gesture)
    }
    
    func swipToDownGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        didSwipToDownGesture?(self, gesture)
    }
}