//
//  ViewController.swift
//  HelloWorld
//
//  Created by 丁偉倫 on 21/02/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ageTextfield: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBAction func submitPressed(_ sender: Any) {
        let ageInCatYears = Int(ageTextfield.text!)! * 7
        ageLabel.text = String(ageInCatYears)
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

