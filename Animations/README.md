# Animation

### Naive Implementation

````swift
    @IBAction func next(_ sender: Any) {
        mSwitch = !mSwitch
        if mSwitch {
            buttonTitle.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.playAnimation), userInfo: nil, repeats: true)
        } else {
            buttonTitle.setTitle("Start", for: .normal)
            timer.invalidate()
        }
    }
    
    var counter = 0
    func playAnimation() {
        counter += 1
        image.image = UIImage(named: "frame_\(counter)_delay-0.04s.gif")
        if counter > 23 {
            counter = 0
        }
    }

````

### Basic Animation Types

* Fade In
````swift
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
````

* Slide In
````swift
    @IBAction func slideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        UIView.animate(withDuration: 1, animations: {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        })
    }
````

* Grow
````swift
    @IBAction func grow(_ sender: Any) {
        let oriX = image.center.x - image.frame.size.width / 2
        let oriY = image.center.y - image.frame.size.height / 2
        let mWidth = image.frame.size.width
        let mHeight = image.frame.size.height
        image.frame = CGRect(x: oriX, y: oriY, width: 0, height: 0)
        UIView.animate(withDuration: 1, animations: {
            self.image.frame = CGRect(x: oriX, y: oriY, width: mWidth, height: mHeight)
        })
    }
````
