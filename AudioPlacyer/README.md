# BacktoBach

### Simple Audio Controller
````swift

import AVFoundation

let audioPath = Bundle.main.path(forResource: "563", ofType: "mp3")

do {
    try player = AVAudioPlayer( contentsOf: URL(fileURLWithPath: audioPath!) )
} catch {
    print(error.localizedDescription)
}
````

### Use Sliders to Control the Volumn and Current Time
````swift
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

func updateScrubber() {
    print("update Scrubber \(scrubber.value)")
    scrubber.value = Float(player.currentTime)
}
````
