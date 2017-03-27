//
//  ViewController.swift
//  DownloadingWebContent
//
//  Created by 丁偉倫 on 28/02/2017.
//  Copyright © 2017 whelan94crown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view did load")
        
//        let url = URL(string: "https://dashboard.zencircle.com")!
//        webView.loadRequest(URLRequest(url: url))
//        webView.loadHTMLString("<h1>Hello ! </h1>", baseURL: nil)
        if let mUrl = URL(string: "https://stackoverflow.com") {
            let mRequest = NSMutableURLRequest(url: mUrl)
            let task = URLSession.shared.dataTask(with: mRequest as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print("there's an error!")
                    print(error!)
                } else {
                    if let unWrappedData = data {
                        let dataString = NSString(data: unWrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString!)
                        
                        DispatchQueue.main.sync {
                            print("update ui here")
                        }
                    }
                }
                
            }
            task.resume()
        }
        
        print("hi there!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

