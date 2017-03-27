//
//  ViewController.swift
//  SwipesAndShakes
//
//  Created by 丁偉倫 on 11/03/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

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
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake {
            print("shake just happend")
            let soundArr = ["Say You Love Me", "Something Just Like This", "Way Down We Go"]
            let randomNum = Int(arc4random_uniform(UInt32(soundArr.count)))
            
            let fileLocation = Bundle.main.path(forResource: soundArr[randomNum], ofType: "mp3")
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
                player.play()
            } catch {
                print(error)
            }
        }
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

