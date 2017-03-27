# SwipeAndShake

### Detect Motion
````swift
override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
    if event?.subtype == .motionShake {
        print("shake just happend")
    }
}
````

### Detect Swipe Gesture
````swift

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(gesture:)))
    swipeRight.direction = .right
    self.view.addGestureRecognizer(swipeRight)

    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(gesture:)))
    swipeLeft.direction = .left
    self.view.addGestureRecognizer(swipeLeft)
}

func swiped(gesture: UISwipeGestureRecognizer) {
    switch gesture.direction {
    case UISwipeGestureRecognizerDirection.right:
        print("swipe right")
    case UISwipeGestureRecognizerDirection.left:
        print("swipe left")
    default:
        print("???")
        break
    }
}
````
