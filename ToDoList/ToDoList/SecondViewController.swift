//
//  SecondViewController.swift
//  ToDoList
//
//  Created by 丁偉倫 on 26/02/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBAction func add(_ sender: Any) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        var items : [String]
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            if itemTextField.text! != "" {
                print("add a valid item")
                items.append(itemTextField.text!)
            } else {
                print("not a valid item")
            }
        } else {
            items = [itemTextField.text!]
        }
        UserDefaults.standard.set(items, forKey: "items")
        itemTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("second view did load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.add("from textFieldShouldReturn")
        return true
    }

}

