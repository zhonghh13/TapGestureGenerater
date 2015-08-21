//
//  ViewController.swift
//  TapGestureGenerater
//
//  Created by ikemai on 08/21/2015.
//  Copyright (c) 2015 ikemai. All rights reserved.
//

import UIKit
import TapGestureGenerater

class ViewController: UIViewController {
    
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var summaryLabelView: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var touchButton: UIButton!
    @IBOutlet weak var pinchingButton: UIButton!
    @IBOutlet weak var pinchInOutButton: UIButton!
    @IBOutlet weak var SwipButton: UIButton!
    
    private var tapGestureView: TapGestureGenerater!
    
    private let tapColor = UIColor.greenColor()
    private let touchColor = UIColor.magentaColor()
    private let pinchColor = UIColor.blueColor()
    private let swipColor = UIColor.orangeColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureView = TapGestureGenerater(frame: view.frame)
        tapGestureView.backgroundColor = UIColor.whiteColor()
        view.addSubview(tapGestureView)
        view.sendSubviewToBack(tapGestureView)
        
        labelView.text = ""
        summaryLabelView.text = ""
        
        setButton(tapButton, color: tapColor)
        setButton(touchButton, color: touchColor)
        setButton(pinchingButton, color: pinchColor)
        setButton(pinchInOutButton, color: pinchColor)
        setButton(SwipButton, color: swipColor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapButtonDidDown(sender: AnyObject) {
        tapGestureView.reset()
        setTapGestures()
    }
    @IBAction func touchButtonDidDown(sender: AnyObject) {
        tapGestureView.reset()
        setTouchesAndDrag()
    }
    @IBAction func pinchingButtonDidDown(sender: AnyObject) {
        tapGestureView.reset()
        setPinchingGesture()
    }
    
    @IBAction func pinchInOutButtonDidDown(sender: AnyObject) {
        tapGestureView.reset()
        setPinchInOutGesture()
    }
    @IBAction func SwipButtonDidDown(sender: AnyObject) {
        tapGestureView.reset()
        setSwipGesture()
    }
    private func setButton(button: UIButton, color: UIColor) {
        button.backgroundColor = color
        button.layer.cornerRadius = tapButton.bounds.width / 2
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }
}
//
// MARK:- Set tap gestures
//
extension ViewController {
    
    private func setTapGestures() {
        // Tap
        tapGestureView.setTapGesture({[weak self] tapGestureView in
            if let me = self {
                me.tapGestureView.backgroundColor = me.tapColor
                me.labelView.text = "Tap Gesture"
                me.summaryLabelView.text = ""
            }
            })
        
        // Double tap
        tapGestureView.setDoubleTapGesture({[weak self] tapGestureView in
            if let me = self {
                me.tapGestureView.backgroundColor = me.tapColor
                me.labelView.text = "Double Tap Gesture"
                me.summaryLabelView.text = ""
            }
            })
        
        // Triple tap
        tapGestureView.setTripleTapGesture({[weak self] tapGestureView in
            if let me = self {
                me.tapGestureView.backgroundColor = me.tapColor
                me.labelView.text = "Triple Tap Gesture"
                me.summaryLabelView.text = ""
            }
            })
    }
}

//
// MARK:- Set touches and dragging
//
extension ViewController {
    
    private func setTouchesAndDrag() {
        // Touches began
        tapGestureView.setTouchesBegan({[weak self] tapGestureView, point in
            if let me = self {
                me.tapGestureView.backgroundColor = me.touchColor
                me.labelView.text = "Touches Began"
                me.summaryLabelView.text = "point = \(point)"
            }
            })
        // Touches cancelled
        tapGestureView.setTouchesCancelled({[weak self] tapGestureView, point in
            if let me = self {
                me.tapGestureView.backgroundColor = me.touchColor
                me.labelView.text = "Touches Cancelled"
                me.summaryLabelView.text = "point = \(point)"
            }
            })
        // Touches ended
        tapGestureView.setTouchesEnded({[weak self] tapGestureView, point in
            if let me = self {
                me.tapGestureView.backgroundColor = me.touchColor
                me.labelView.text = "Touches Ended"
                me.summaryLabelView.text = "point = \(point)"
            }
            })
        // Dragging
        tapGestureView.setDraggingGesture({[weak self] tapGestureView, deltaPoint in
            if let me = self {
                me.tapGestureView.backgroundColor = me.touchColor
                me.labelView.text = "Dragging"
                me.summaryLabelView.text = "deltaPoint = \(deltaPoint)"
            }
            })
    }
}

//
// MARK:- Set pinch gestures
//
extension ViewController {
    
    private func setPinchingGesture() {
        // Pinching
        tapGestureView.setPinchingGesture({[weak self] tapGestureView, sender in
            if let me = self {
                me.tapGestureView.backgroundColor = me.pinchColor
                me.labelView.text = "Pinching Gesture"
                me.summaryLabelView.text = "sender = \(sender)"
            }
            })
    }
    
    private func setPinchInOutGesture() {
        // Pinch in
        tapGestureView.setPinchInGesture({[weak self] tapGestureView, sender in
            if let me = self {
                me.tapGestureView.backgroundColor = me.pinchColor
                me.labelView.text = "Pinch In Gesture"
                me.summaryLabelView.text = "sender = \(sender)"
            }
            })
        // Pinch out
        tapGestureView.setPinchOutGesture({[weak self] tapGestureView, sender in
            if let me = self {
                me.tapGestureView.backgroundColor = me.pinchColor
                me.labelView.text = "Pinch Out Gesture"
                me.summaryLabelView.text = "sender = \(sender)"
            }
            })
    }
}

//
// MARK:- Set swip gestures
//
extension ViewController {
    
    private func setSwipGesture() {
        // Swip to left
        tapGestureView.setSwipToLeftGesture({[weak self] tapGestureView, gesture in
            if let me = self {
                me.tapGestureView.backgroundColor = me.swipColor
                me.labelView.text = "Swip To Left"
                me.summaryLabelView.text = "gesture = \(gesture)"
            }
            })
        // Swip to right
        tapGestureView.setSwipToRightGesture({[weak self] tapGestureView, gesture in
            if let me = self {
                me.tapGestureView.backgroundColor = me.swipColor
                me.labelView.text = "Swip To Right"
                me.summaryLabelView.text = "gesture = \(gesture)"
            }
            })
        // Swip to top
        tapGestureView.setSwipToUpGesture({[weak self] tapGestureView, gesture in
            if let me = self {
                me.tapGestureView.backgroundColor = me.swipColor
                me.labelView.text = "Swip To Up"
                me.summaryLabelView.text = "gesture = \(gesture)"
            }
            })
        // Swip to down
        tapGestureView.setSwipToDownGesture({[weak self] tapGestureView, gesture in
            if let me = self {
                me.tapGestureView.backgroundColor = me.swipColor
                me.labelView.text = "Swip To Down"
                me.summaryLabelView.text = "gesture = \(gesture)"
            }
            })
    }
}

