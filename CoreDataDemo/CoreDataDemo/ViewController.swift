//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by 丁偉倫 on 19/03/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var welcomeMessage: UILabel!
    
    @IBAction func login(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newValue = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        newValue.setValue(textField.text, forKey: "username")
        
        do {
            try context.save()
            textField.alpha = 0
            loginButton.alpha = 0
            welcomeMessage.alpha = 1
            welcomeMessage.text = "Hello, \(textField.text!)!"
        } catch  {
            print("failed to save")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject] {
                if let username = result.value(forKey: "username") as? String {
                    textField.alpha = 0
                    loginButton.alpha = 0
                    welcomeMessage.alpha = 1
                    welcomeMessage.text = "Hello, \(username)!"
                }
            }
        } catch  {
            print("request failed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

