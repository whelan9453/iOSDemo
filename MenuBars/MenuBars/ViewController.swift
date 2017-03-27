//
//  ViewController.swift
//  MenuBars
//
//  Created by 丁偉倫 on 25/02/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var timer = Timer();
    private var time = 210
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func playPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }
    @IBAction func fastForwardPressed(_ sender: Any) {
        time += 10
        setTimeLabel()
    }
    @IBAction func fastBackwardPressed(_ sender: Any) {
        time = time > 10 ? time - 10 : 0
        setTimeLabel()
    }
    @IBAction func resetPressed(_ sender: Any) {
        timer.invalidate()
        time = 210
        setTimeLabel()
    }
    
    func processTimer() {
        print("precessTimer!")
        if time > 0 {
            time -= 1
            setTimeLabel()
        } else {
            timer.invalidate()
            print("timer invalidate")
        }
    }
    
    func setTimeLabel() {
        remainingTimeLabel.text = String(time)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

