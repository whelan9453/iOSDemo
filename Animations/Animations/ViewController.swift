//
//  ViewController.swift
//  Animations
//
//  Created by 丁偉倫 on 01/03/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var buttonTitle: UIButton!
    
    var timer = Timer()
    var mSwitch = false
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
    
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    
    @IBAction func slideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        UIView.animate(withDuration: 1, animations: {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        })
    }
    
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
    
    var counter = 0
    func playAnimation() {
        counter += 1
        image.image = UIImage(named: "frame_\(counter)_delay-0.04s.gif")
        if counter > 23 {
            counter = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

