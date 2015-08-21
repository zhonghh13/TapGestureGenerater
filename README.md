# TapGestureGenerater

[![CI Status](http://img.shields.io/travis/ikemai/TapGestureGenerater.svg?style=flat)](https://travis-ci.org/ikemai/TapGestureGenerater)
[![Version](https://img.shields.io/cocoapods/v/TapGestureGenerater.svg?style=flat)](http://cocoapods.org/pods/TapGestureGenerater)
[![License](https://img.shields.io/cocoapods/l/TapGestureGenerater.svg?style=flat)](http://cocoapods.org/pods/TapGestureGenerater)
[![Platform](https://img.shields.io/cocoapods/p/TapGestureGenerater.svg?style=flat)](http://cocoapods.org/pods/TapGestureGenerater)

TapGestureGenerater is get tap and gesture event
* Image capture
![Png](https://github.com/ikemai/assets/blob/master/TapGestureGeneraterView/tapGestureSumple.png)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TapGestureGenerater is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

* swift
```ruby
pod "TapGestureGenerater"
```
* swift 2.0
```ruby
pod 'TapGestureGenerater', :git => "https://github.com/ikemai/TapGestureGenerater.git", :branch => "swift-2.0"
```
### Example

* Set TapGestureGenerater

```swift
let gestureView = TapGestureGenerater(frame: view.frame)
view.addSubview(gestureView)
```

* Remove the set was all gestures

```swift
gestureView.reset()
```

* Set tap gesture

```swift
// Tap
gestureView.setTapGesture({[weak self] view in
  if let me = self {
    me.labelView.text = "Tap Gesture"
  }
})

// Double tap
gestureView.setDoubleTapGesture({[weak self] view in
  if let me = self {
    me.labelView.text = "Double Tap Gesture"
  }
})

// Triple tap
gestureView.setTripleTapGesture({[weak self] view in
  if let me = self {
    me.labelView.text = "Triple Tap Gesture"
  }
})
```

* Set touches and dragging

```swift
// Touches began
gestureView.setTouchesBegan({[weak self] view, point in
  if let me = self {
    me.labelView.text = "Touches Began"
    me.summaryLabelView.text = "point = \(point)"
  }
})
// Touches cancelled
gestureView.setTouchesCancelled({[weak self] view, point in
  if let me = self {
    me.labelView.text = "Touches Cancelled"
    me.summaryLabelView.text = "point = \(point)"
  }
})
// Touches ended
gestureView.setTouchesEnded({[weak self] view, point in
  if let me = self {
    me.labelView.text = "Touches Ended"
    me.summaryLabelView.text = "point = \(point)"
  }
})
// Dragging
gestureView.setDraggingGesture({[weak self] view, deltaPoint in
  if let me = self {
    me.labelView.text = "Dragging"
    me.summaryLabelView.text = "deltaPoint = \(deltaPoint)"
  }
})
```

* Set pinch gestures

```swift
// Pinching
gestureView.setPinchingGesture({[weak self] view, sender in
  if let me = self {
    me.labelView.text = "Pinching Gesture"
    me.summaryLabelView.text = "sender = \(sender)"
  }
})
// Pinch in
gestureView.setPinchInGesture({[weak self] view, sender in
  if let me = self {
    me.labelView.text = "Pinch In Gesture"
    me.summaryLabelView.text = "sender = \(sender)"
  }
})
// Pinch out
gestureView.setPinchOutGesture({[weak self] view, sender in
  if let me = self {
    me.labelView.text = "Pinch Out Gesture"
    me.summaryLabelView.text = "sender = \(sender)"
  }
})
```

* Set swip gestures

```swift
// Swip to left
gestureView.setSwipToLeftGesture({[weak self] view, gesture in
  if let me = self {
    me.labelView.text = "Swip To Left"
    me.summaryLabelView.text = "gesture = \(gesture)"
  }
})
// Swip to right
gestureView.setSwipToRightGesture({[weak self] view, gesture in
  if let me = self {
    me.labelView.text = "Swip To Right"
    me.summaryLabelView.text = "gesture = \(gesture)"
  }
})
// Swip to top
gestureView.setSwipToUpGesture({[weak self] view, gesture in
  if let me = self {
    me.labelView.text = "Swip To Up"
    me.summaryLabelView.text = "gesture = \(gesture)"
  }
})
// Swip to down
gestureView.setSwipToDownGesture({[weak self] view, gesture in
  if let me = self {
    me.labelView.text = "Swip To Down"
    me.summaryLabelView.text = "gesture = \(gesture)"
  }
})
```

### Function

* Remove the set was all gestures

```swift
func reset()
```

* Set tap gesture

```swift
// Tap
func setTapGesture(event: (TapGestureGenerater) -> Void)

// Double tap
func setDoubleTapGesture(event: (TapGestureGenerater) -> Void)

// Triple tap
func setTripleTapGesture(event: (TapGestureGenerater) -> Void)
```

* Set touches and dragging

```swift
// Touches began
func setTouchesBegan(event: (TapGestureGenerater, CGPoint) -> Void)

// Touches cancelled
func setTouchesCancelled(event: (TapGestureGenerater, CGPoint) -> Void)

// Touches ended
func setTouchesEnded(event: (TapGestureGenerater, CGPoint) -> Void)

// Dragging
func setDraggingGesture(event: (TapGestureGenerater, CGPoint) -> Void)
```

* Set pinch gestures

```swift
// Pinching
func setPinchingGesture(event: (TapGestureGenerater, UIPinchGestureRecognizer) -> Void)

// Pinch in
func setPinchInGesture(event: (TapGestureGenerater, UIPinchGestureRecognizer) -> Void)

// Pinch out
func setPinchOutGesture(event: (TapGestureGenerater, UIPinchGestureRecognizer) -> Void)
```

* Set swip gestures

```swift
// Swip to left
func setSwipToLeftGesture(event: (TapGestureGenerater, UIGestureRecognizer) -> Void)

// Swip to right
func setSwipToRightGesture(event: (TapGestureGenerater, UIGestureRecognizer) -> Void)

// Swip to top
func setSwipToUpGesture(event: (TapGestureGenerater, UIGestureRecognizer) -> Void)

// Swip to down
func setSwipToDownGesture(event: (TapGestureGenerater, UIGestureRecognizer) -> Void)
```

## Author

ikemai, ikeda_mai@cyberagent.co.jp

## License

TapGestureGenerater is available under the MIT license. See the LICENSE file for more info.
