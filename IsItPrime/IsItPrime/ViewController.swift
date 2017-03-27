//
//  ViewController.swift
//  IsItPrime
//
//  Created by 丁偉倫 on 25/02/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultTextField: UILabel!
    @IBAction func onClick(_ sender: Any) {
//        let input = Int(inputTextField.text ?? "0") ?? 0
//        resultTextField.text = isPrime(n: input) ? "\(input) is prime!" : "\(input) is not prime!"
        
        if let input = inputTextField.text {
            if let inputNumeber = Int(input) {
                resultTextField.text = isPrime(n: inputNumeber) ? "\(input) is prime!" : "\(input) is not prime!"
            } else {
                resultTextField.text = "please enter a integer number!"
            }
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

    func isPrime(n : Int) -> Bool {
        if n % 2 == 0 {
            return false
        }
        var i = 3
        while i * i <= n {
            if (n % i == 0) {
                return false
            }
            i += 2
        }
        return true
    }
}

