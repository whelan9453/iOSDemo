//
//  ViewController.swift
//  HowManyFingers
//
//  Created by 丁偉倫 on 23/02/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBAction func userClcik(_ sender: Any) {
        print("onClick!")
        let random = Int(arc4random_uniform(5) + 1)//create random numbers from 1 to 5
        let input = Int(userInput.text ?? "0") ?? 0
        print("random: " + String(random))
        print("input: " + String(input))
        answerLabel.text = random == input ? "You're right!" : "Wrong! It was a \(random)"
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

