//
//  ViewController.swift
//  PermanentDataStorage
//
//  Created by 丁偉倫 on 26/02/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    @IBAction func savePressed(_ sender: Any) {
        UserDefaults.standard.set(numberField.text, forKey: "number")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("first view did load")
        let numberObj = UserDefaults.standard.object(forKey: "number")
        if let number = numberObj as? String {
            numberField.text = number
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

