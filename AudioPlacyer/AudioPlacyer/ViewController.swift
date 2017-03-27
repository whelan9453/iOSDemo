//
//  ViewController.swift
//  AudioPlacyer
//
//  Created by 丁偉倫 on 11/03/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    var timer = Timer()
    let audioPath = Bundle.main.path(forResource: "563", ofType: "mp3")
    
    @IBAction func play(_ sender: Any) {
        if !player.isPlaying {
            player.play()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
        }
    }
    @IBAction func pause(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            timer.invalidate()
        }
    }
    @IBAction func stop(_ sender: Any) {
        player.stop()
        scrubber.value = 0
        timer.invalidate()
        do {
            try player = AVAudioPlayer( contentsOf: URL(fileURLWithPath: audioPath!) )
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBAction func volumeChanged(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    @IBOutlet weak var scrubber: UISlider!
    @IBAction func scrubberChanged(_ sender: Any) {
        player.currentTime = TimeInterval(scrubber.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            try player = AVAudioPlayer( contentsOf: URL(fileURLWithPath: audioPath!) )
            scrubber.maximumValue = Float(player.duration)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func updateScrubber() {
        print("update Scrubber \(scrubber.value)")
        scrubber.value = Float(player.currentTime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

